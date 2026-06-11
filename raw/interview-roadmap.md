# LLM 与 AI Agent 工程面试路线

> 目标：服务 LLM / AI Agent / Harness / Agent Loop 工程岗位面试准备。路线按工程能力组织，每个主题都要能转化为可讲述的设计、取舍、事故和项目经验。

## 1. LLM 基础

- Transformer、Attention、KV Cache、上下文窗口、采样参数。
- Prompt、System / User / Tool 消息边界。
- Structured Output、JSON Schema、函数调用的可靠性边界。
- 模型能力差异：推理、代码、工具使用、多模态、长上下文。

## 2. Agent Loop 工程

- 单轮请求与多轮 Agent Loop 的区别。
- 状态机：输入收集、上下文组装、模型调用、工具执行、结果回灌、终止条件。
- 中断、重试、超时、预算、幂等和可恢复执行。
- Streaming loop 与 batch loop 的设计差异。

## 3. Harness 工程

- Harness 的角色：任务编排、环境管理、工具接入、评测驱动、轨迹记录。
- 用例：代码智能体、浏览器智能体、数据分析智能体、客服/运营智能体。
- 任务输入、执行环境、工具权限、结果校验、日志回放。
- 离线 harness 与线上 runtime 的边界。

## 4. Tool Calling / MCP / 工具生态

- Tool schema 设计、参数校验、权限检查、执行结果协议。
- 并发工具、只读工具、高风险工具、工具发现与渐进加载。
- MCP server / client / transport / resource / prompt / tool 的工程接入。
- 工具失败、部分成功、重复调用和 side effect 控制。

## 5. Memory 与 Context Engineering

- 短期上下文、长期记忆、检索记忆、用户画像、项目记忆。
- Token 预算、上下文裁剪、摘要、压缩、缓存前缀。
- 记忆写入时机：显式保存、后台抽取、会话结束抽取。
- 记忆污染、过期、权限和可解释性问题。

## 6. Planning / Reasoning / Search

- ReAct、Plan-and-Execute、Reflection、Self-Consistency。
- Tree search、Graph search、任务分解与子任务调度。
- 计划质量评估、计划修正、失败恢复。
- 何时需要复杂 planning，何时简单 loop 更稳定。

## 7. RAG 与检索增强

- 文档解析、chunking、embedding、向量索引、BM25、hybrid search。
- rerank、query rewrite、上下文拼接、引用和可追溯性。
- RAG 质量评估：召回、精度、答案忠实度、覆盖率。
- Agentic RAG：多步检索、工具化检索、检索计划。

## 8. Eval 与 Observability

- Offline eval、online eval、golden set、LLM-as-judge。
- Trace、span、token、cost、latency、tool metrics。
- 失败样本归因：模型、提示词、工具、检索、权限、环境。
- 质量门禁、回归测试、灰度和监控。

## 9. Multi-Agent

- Supervisor、worker、planner、critic、specialist。
- 通信协议、共享状态、权限隔离、结果合并。
- 多智能体的收益与复杂性成本。
- 适合多智能体的任务边界。

## 10. Safety / Permissions / Sandbox

- 文件、网络、命令、浏览器、数据库等工具权限。
- allow / ask / deny 策略。
- 沙箱隔离、审计日志、敏感信息保护。
- Prompt injection、tool injection、data exfiltration 风险。

## 11. Agent 系统设计

- 设计一个代码智能体。
- 设计一个企业知识库问答 Agent。
- 设计一个 Agent eval 平台。
- 设计一个 MCP 工具市场。
- 设计一个可观测 Agent runtime。

## 12. 项目表达

- 用 STAR 结构讲工程项目。
- 重点讲清楚：问题、约束、方案、取舍、指标、事故、复盘。
- 每个项目准备 30 秒版、2 分钟版、深挖版。
- 每个能力点至少绑定一个项目故事。
