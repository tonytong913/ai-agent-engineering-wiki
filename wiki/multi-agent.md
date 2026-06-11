# Multi-Agent

## 面试定位

Multi-Agent 不是越多越好。面试重点是你能否讲清楚多智能体带来的协作收益，以及通信、状态、权限、成本和结果合并的复杂性。

## 核心概念

- **Supervisor**：负责拆解任务、分配子任务、汇总结果。
- **Worker**：执行具体子任务。
- **Critic / Reviewer**：检查结果质量，提出修正。
- **Specialist**：面向特定领域或工具集的智能体。
- **Shared state**：多智能体之间共享或隔离的任务状态。

## 工程实现

- 多智能体适合任务可拆分、专业性强、需要并行探索的场景。
- 每个 agent 应有明确角色、工具权限和输出协议。
- 通信内容要结构化，避免无限对话和上下文污染。
- 汇总阶段要处理冲突结论、置信度和证据来源。
- 成本和延迟要纳入设计，多智能体会显著放大调用量。

## 常见面试题

- 多智能体相对单智能体有什么收益？
- Supervisor 模式适合什么场景？
- 多个 agent 结论冲突时如何处理？
- 多智能体如何避免上下文污染？

## 追问点

- 如何做 agent 间权限隔离？
- 多智能体任务如何做 trace？
- 什么时候不应该使用 multi-agent？

## 项目表达

可以讲一个“代码审查多智能体”的项目：planner 拆任务，specialist 分别检查安全、性能、测试，reviewer 汇总冲突并输出最终建议。

## 资料索引

- [Planning / Reasoning](planning-reasoning.md)
- [Eval 与可观测性](eval-observability.md)

## 开放问题

- 准备一个 supervisor-worker 架构图。
- 准备一个“为什么不用 multi-agent”的反向回答。
