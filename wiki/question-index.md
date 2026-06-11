# 技术问题索引

## 交流定位

本页用于把原始问题池整理成可复习的索引。详细答案应落在对应专题页，本页负责导航和追问串联。

## 核心概念

- 问题先进入 [原始问题池](../raw/question-bank.md)。
- 已整理的问题反链到具体专题页。
- 同一个问题可以关联多个专题，例如“工具失败恢复”同时关联 Agent Loop、Tool Calling 和 Eval。

## 工程实现

- 每次深化一个专题后，同步把该专题的高频问题加入本页。
- 对技术交流高频问题标记优先级。
- 对项目型问题链接到 [project-stories.md](project-stories.md)。

## 高频问题

| 问题 | 关联专题 | 优先级 |
|------|----------|--------|
| temperature、top_p、top_k 对 Agent 稳定性有什么影响？ | [llm-foundation.md](llm-foundation.md) | 高 |
| 上下文窗口、KV Cache 和输出 token 预算是什么关系？ | [llm-foundation.md](llm-foundation.md) | 高 |
| 长上下文模型是否可以替代 RAG？ | [llm-foundation.md](llm-foundation.md) | 高 |
| Structured Output 为什么不能只依赖提示词？ | [llm-foundation.md](llm-foundation.md) | 高 |
| System prompt、user message、tool result 的安全边界有什么区别？ | [llm-foundation.md](llm-foundation.md) | 高 |
| 一个生产级 Agent Loop 包含哪些阶段？ | [agent-loop.md](agent-loop.md) | 高 |
| Harness 和 Agent runtime 的边界是什么？ | [harness-engineering.md](harness-engineering.md) | 高 |
| MCP 解决了什么工程问题？ | [tool-calling.md](tool-calling.md) | 高 |
| Agent 应该如何管理上下文和长期记忆？ | [memory-context.md](memory-context.md) | 高 |
| 如何构建 Agent 的回归测试集？ | [eval-observability.md](eval-observability.md) | 高 |
| 如何防御 prompt injection？ | [safety-permissions.md](safety-permissions.md) | 高 |
| 设计一个代码 Agent 平台。 | [system-design.md](system-design.md) | 高 |
| 介绍一个你做过的 AI Agent 项目。 | [project-stories.md](project-stories.md) | 高 |

## 追问点

- 每个问题都要准备“概念版”和“项目版”两种回答。
- 高频问题要准备反问：业务目标是什么、工具边界是什么、评估指标是什么。
- 系统设计题要主动覆盖安全、eval 和可观测性。

## 项目表达

问题索引应服务模拟技术交流：每次练习后，把卡住的问题补回对应专题页。

## 资料索引

- [问题池](../raw/question-bank.md)
- [项目故事](project-stories.md)

## 开放问题

- 按岗位 JD 把问题标记为必会、常见和加分。
- 为最高优先级问题补充 2 分钟标准答案。
