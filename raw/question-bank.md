# AI Agent 工程技术问题池

> 原始问题池。问题可以继续追加，整理后的答案应沉淀到 `wiki/` 对应专题页，并在 `wiki/question-index.md` 建立反链。

## LLM 基础

- 你如何解释上下文窗口、KV Cache 和输出 token 预算之间的关系？
- Temperature、top_p、top_k 对 Agent 稳定性有什么影响？
- Structured Output 为什么不能只依赖提示词约束？
- 长上下文模型是否可以替代 RAG？

## Agent Loop

- 一个生产级 Agent Loop 通常包含哪些阶段？
- Agent 何时停止？如何避免无限循环？
- 工具调用失败后应该如何恢复？
- Streaming tool execution 和普通 tool execution 的差异是什么？

## Harness 工程

- Harness 和 Agent runtime 的边界是什么？
- 如何设计一个可复现实验的 Agent harness？
- 如何记录一次 Agent 任务的完整轨迹？
- 离线 eval harness 如何服务线上迭代？

## Tool Calling / MCP

- Tool schema 应该如何设计，才能减少模型误用？
- 如何处理高风险工具，比如 shell、数据库写入、外部 API？
- MCP 解决了什么工程问题？
- 工具很多时，如何避免 prompt 过长和工具选择混乱？

## Memory / Context

- Agent 记忆系统应该写什么，不应该写什么？
- 如何避免长期记忆污染？
- 自动摘要和原文保留之间如何取舍？
- 什么时候应该 compact，什么时候应该重新检索？

## Planning / Reasoning

- ReAct 和 Plan-and-Execute 的区别是什么？
- Reflection 在什么情况下有用，什么时候会浪费 token？
- 如何评估一个 Agent 计划是否可靠？
- 多步任务失败时，应该回滚还是局部修正？

## RAG

- 如何设计 chunking 策略？
- hybrid search 和 rerank 分别解决什么问题？
- 如何评估 RAG 是否真的命中了正确证据？
- Agentic RAG 和普通 RAG 的区别是什么？

## Eval / Observability

- 你会如何构建 Agent 的回归测试集？
- LLM-as-judge 有哪些偏差，如何控制？
- 线上 Agent 需要监控哪些指标？
- 如何从 trace 中定位一次失败是模型问题还是工具问题？

## Multi-Agent

- 多智能体相对单智能体的收益是什么？
- 多智能体系统如何避免互相污染上下文？
- Supervisor 模式和 swarm 模式分别适合什么场景？
- 如何合并多个 agent 的冲突结论？

## Safety / Permissions

- 如何防御 prompt injection？
- 工具权限系统如何设计？
- Agent 沙箱需要隔离哪些资源？
- 如何防止敏感数据通过工具调用泄露？

## 系统设计

- 设计一个代码 Agent 平台。
- 设计一个企业内部知识库 Agent。
- 设计一个 Agent 评测平台。
- 设计一个 MCP 工具管理平台。
- 设计一个支持多模型路由的 Agent runtime。
