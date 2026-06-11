# Planning / Reasoning / Search

## 面试定位

Planning 主题用于说明你是否理解“什么时候需要计划，什么时候简单 loop 更稳定”。面试官通常会追问 ReAct、Plan-and-Execute、Reflection、搜索和失败恢复的实际收益。

## 核心概念

- **ReAct**：推理和行动交替，适合需要边查边做的任务。
- **Plan-and-Execute**：先生成计划，再分步执行，适合结构清晰的长任务。
- **Reflection**：在失败或阶段结束后自我检查和修正。
- **Search**：用树或图探索多个候选路径。
- **Failure recovery**：计划失败后局部修正、重规划或终止。

## 工程实现

- 不要默认引入复杂 planning；简单任务直接执行更可靠。
- 计划要可检查、可中断、可回放，不能只是一段自然语言。
- 每个步骤应绑定工具、输入、预期输出和失败处理。
- Reflection 应有触发条件，例如测试失败、评分低、工具异常。
- 搜索策略要受预算约束，避免指数级 token 消耗。

## 常见面试题

- ReAct 和 Plan-and-Execute 有什么区别？
- Reflection 在什么情况下有用？
- 如何评估一个计划是否可靠？
- 多步任务失败时应该回滚还是局部修正？

## 追问点

- 计划和真实执行偏离时如何处理？
- 如何防止 Agent 过度思考？
- Tree search 在生产系统里有哪些成本问题？

## 项目表达

可以讲一个“从单步执行到计划执行”的项目：针对长任务先生成可验证步骤，执行时记录每步状态，失败时只重做受影响步骤。

## 资料索引

- [Agent Loop 工程](agent-loop.md)
- [Eval 与可观测性](eval-observability.md)

## 开放问题

- 准备一个 ReAct 与 Plan-and-Execute 对比回答。
- 准备一个失败后重规划案例。
