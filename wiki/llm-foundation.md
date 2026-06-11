# LLM 基础

## 交流定位

这个主题用于回答“你是否理解 Agent 背后的模型能力边界”。重点不是复述 Transformer 细节，而是能解释上下文、采样、结构化输出、工具调用和模型差异如何影响 Agent 工程稳定性。

## 核心概念

- **上下文窗口**：模型一次请求可见的输入上限，包含 system、user、assistant、tool 结果和输出预算。
- **KV Cache**：推理时缓存历史 token 的 key/value，影响长上下文推理成本和延迟。
- **采样参数**：temperature、top_p 等影响输出稳定性，Agent 场景通常更偏确定性。
- **结构化输出**：通过 JSON Schema 或 tool schema 约束输出格式，但仍需要校验和重试。
- **模型能力边界**：不同模型在工具调用、长上下文、代码、推理、多模态方面表现不同。

## 工程实现

- 请求组装时要明确 system / user / tool 消息边界，避免指令污染。
- 对结构化输出做 schema 校验，失败后用可控重试，而不是盲目信任模型。
- 对长上下文任务做预算管理，把输出 token、工具结果和历史消息一起纳入计算。
- 根据任务选择模型：复杂推理、低延迟、低成本、长上下文不能只看一个指标。

## 常见技术交流问题

- 为什么 Agent 场景通常不希望 temperature 太高？
- 长上下文模型是否可以替代 RAG？
- Structured Output 为什么仍然需要后处理校验？
- System prompt 和 tool result 在安全上有什么区别？

## 追问点

- 模型输出不符合 schema 时如何恢复？
- 如何评估一个模型是否适合工具调用？
- 如果上下文接近上限，系统应该先删什么？

## 技术探讨问答

### Q1: temperature、top_p、top_k 分别控制什么？

**简答**：它们都控制模型从候选 token 中选择下一个 token 的方式。`temperature` 调整概率分布的随机性，`top_p` 保留累计概率达到阈值的一组候选，`top_k` 只保留概率最高的固定数量候选。

**展开**：

- `temperature` 越低，模型越倾向选择最高概率 token，输出更稳定；越高，低概率 token 更容易被采样，输出更发散。
- `top_p` 是动态候选池。比如 `top_p=0.9` 时，模型只在累计概率约 90% 的候选 token 中采样。
- `top_k` 是固定候选池。比如 `top_k=20` 时，每一步只从概率最高的 20 个 token 里采样。

**Agent 工程视角**：这些参数不只是影响“表达风格”，还会影响工具选择、JSON 字段、参数生成、计划路径和可复现性。Agent 的行动阶段通常使用低随机性；探索、头脑风暴、多方案生成阶段可以适度提高随机性。

**相关参数**：

- `max_output_tokens`：限制本次最多生成多少 token，影响成本、延迟和输出完整性。
- `stop`：遇到指定停止序列后结束生成。
- `seed`：提高可复现性，但不同模型和服务不一定保证完全一致。
- `frequency_penalty` / `presence_penalty`：降低重复内容或鼓励引入新内容。
- `logit_bias`：人为提高或降低某些 token 的概率。
- `response_format` / `json_schema`：约束结构化输出格式。
- `tools` / `tool_choice`：提供工具列表，并控制模型是否自动选择或必须调用某个工具。
- `stream`：流式返回结果，适合交互体验和流式工具调用。

**一句话记忆**：`temperature` 控制随机性，`top_p` 控制累计概率范围，`top_k` 控制候选数量；Agent 执行阶段追求稳定，探索阶段才需要多样性。

### Q2: 上下文窗口、KV Cache 和输出 token 预算是什么关系？

**简答**：上下文窗口限制一次生成链路中能处理的总 token 序列长度；输出 token 会在生成过程中逐步追加到上下文里，所以必须预留输出空间；KV Cache 是模型推理层缓存 attention key/value 的优化，不是 Agent 层机制。

**展开**：

```text
输入 token + 已生成输出 token <= context window
```

上下文窗口不是只给输入用。模型是自回归生成：先基于输入生成第一个 token，再基于“输入 + 第一个输出 token”生成第二个 token。已生成输出会成为后续生成的上下文，因此工程上要从窗口中预留输出预算。

KV Cache 发生在 Transformer 推理层，用来缓存历史 token 的 key/value，避免每生成一个新 token 都重复计算全部历史。它可以改善长上下文生成的延迟和成本，但不会扩大上下文窗口。

**Agent 工程视角**：Agent 会不断积累 system、history、tool result、RAG 片段、memory 和任务状态。如果不做裁剪、摘要、检索和输出预留，很容易撞到窗口上限，或因为输出预算不足导致 JSON、tool call、最终回答被截断。

**一句话记忆**：上下文窗口管容量，输出 token 预算管生成长度，KV Cache 管推理复用效率。

### Q3: 长上下文模型是否可以替代 RAG？

**简答**：不能完全替代。长上下文解决“读得下”，RAG 解决“找得准、管得住、引得出、评得清”。

**展开**：

长上下文模型可以一次阅读更多材料，适合单个长文档总结、用户显式上传资料分析、代码集合阅读等场景。它会削弱一部分简单 RAG 的必要性。

但企业知识系统里，RAG 解决的不只是容量：

- 大规模语料中如何找到相关内容。
- 文档频繁更新时如何保持知识新鲜。
- 不同用户、团队、项目的权限过滤。
- 答案引用、来源、版本和可追溯。
- 降低长上下文输入成本和延迟。
- 评估召回、rerank、grounding 和答案忠实度。

**Agent 工程视角**：Agent 是多轮系统，每轮都塞大量长上下文会放大成本和噪声。更合理的方式是让 RAG 负责证据选择，让长上下文负责阅读更大的相关片段。

**一句话记忆**：长上下文增强 RAG，而不是替代 RAG。

### Q4: Structured Output 为什么不能只依赖提示词？

**简答**：提示词只能提高模型输出结构化内容的倾向，不能保证 JSON 语法合法、schema 合法、业务语义有效，也不能保证工具调用安全。

**展开**：

结构化输出至少有四层风险：

- JSON 语法不合法：多余解释、代码块、尾逗号、截断。
- JSON 合法但 schema 不合法：字段名错、类型错、多字段或少字段。
- schema 合法但业务语义不合法：路径越权、命令危险、参数不符合业务约束。
- 结构合法但安全不可执行：高风险工具仍需要权限检查和确认。

**Agent 工程视角**：Tool Calling 本质上是 Structured Output 的工程化形式。模型可以建议调用工具，但真正能不能执行，要由 runtime 的 schema 校验、业务校验、权限系统和审计链路决定。

**延伸探讨 topic**：Structured Output 校验闭环如何落地。关键词：schema 定义、模型结构化输出、parse、schema validation、业务语义校验、权限检查、错误回灌重试、fallback 或人工处理。

**一句话记忆**：提示词提高倾向，schema 约束格式，校验保证可用，权限决定能不能执行。

### Q5: System prompt、user message、tool result 的安全边界有什么区别？

**简答**：System 是系统规则，User 是用户目标，Tool/RAG 是外部数据。数据不能升级成指令，模型建议不能绕过权限。

**展开**：

可以把消息分成不同信任级别：

```text
system / developer instruction
> user message
> tool result / retrieved documents / web page content
```

- `system prompt` 定义角色、规则、安全边界、工具规范和输出要求。
- `user message` 表达用户目标，但不代表用户拥有无限权限。
- `tool result`、网页、文件、RAG 文档都属于不可信数据，只能作为事实材料，不能覆盖系统规则。

**Agent 工程视角**：普通聊天被 prompt injection 影响，通常只是回答变差；Agent 被污染后可能调用 shell、文件、网络、数据库等工具，风险会升级成真实副作用。因此 runtime 必须保留 role 边界、标记不可信数据，并独立做权限检查。

**一句话记忆**：System 是规则，User 是目标，Tool/RAG 是数据。

## 项目表达

可以讲一次“模型能力评估和路由”的经历：用任务集比较不同模型的成功率、延迟、成本和工具调用稳定性，最后为不同任务选择不同模型。

## 资料索引

- [能力路线](../raw/engineering-roadmap.md)
- [问题池](../raw/question-bank.md)

## 开放问题

- 延伸探讨：Structured Output 校验闭环如何落地。关键词：schema 定义、模型结构化输出、parse、schema validation、业务语义校验、权限检查、错误回灌重试、fallback 或人工处理。
- 延伸探讨：如何评估一个模型是否适合工具调用。关键词：tool selection accuracy、argument validity、schema adherence、recovery、latency、cost、trace。
