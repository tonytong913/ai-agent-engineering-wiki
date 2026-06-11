# 职业准备日志

> 记录 LLM 与 AI Agent 工程职业准备过程。append-only：只追加新条目，不重写历史。

---

## [2026-06-11] init | 初始化 AI Agent 工程能力 Wiki

**范围**：`raw/`、`wiki/`、`docs/superpowers/`

**目标**：参考 agents_learning wiki 的构建思路，建立面向 LLM / AI Agent / Harness / Agent Loop 工程能力的中文 wiki。

**产出**：

1. 创建 `raw/engineering-roadmap.md`：能力路线。
2. 创建 `raw/question-bank.md`：原始问题池。
3. 创建 `raw/project-inventory.md`：项目素材模板。
4. 创建 `wiki/index.md`：主题目录和状态源。
5. 创建 13 个专题页：覆盖 LLM 基础、Agent Loop、Harness、Tool Calling、Memory、Planning、RAG、Eval、Multi-Agent、安全、系统设计、项目故事和问题索引。

**下一步**：优先深化 Agent Loop 与 Harness 工程，将每个主题页从骨架推进到“可交流版本”。

---

## [2026-06-11] study | LLM 基础第一轮技术探讨

**范围**：`wiki/llm-foundation.md`、`wiki/question-index.md`

**讨论内容**：

1. 采样参数：temperature、top_p、top_k 的含义，以及它们如何影响 Agent 的工具选择、结构化输出和可复现性。
2. 上下文预算：上下文窗口、输出 token 预算和 KV Cache 的关系；明确 KV Cache 属于模型推理层优化，不是 Agent 层机制。
3. 长上下文与 RAG：长上下文解决“读得下”，RAG 解决“找得准、管得住、引得出、评得清”。
4. Structured Output：提示词不能保证结构可靠；schema、校验、权限和 fallback 需要形成闭环，具体落地作为延伸 topic。
5. 消息安全边界：System 是规则，User 是目标，Tool/RAG 是数据；外部数据不能升级成指令。

**产出**：将以上内容整理为 `LLM 基础` 专题的“技术探讨问答”，并同步补充问题索引。

**下一步**：继续延伸 `Structured Output 校验闭环如何落地`，或进入 `如何评估模型是否适合工具调用`。
