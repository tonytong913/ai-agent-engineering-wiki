# LLM 与 AI Agent 工程面试 Wiki

> 面向 LLM 应用、AI Agent、Agent Loop、Harness、工具生态、RAG、Eval 与可观测性的面试准备 wiki。
> 维护方式参考 agents_learning wiki：`raw/` 放原始材料，`wiki/` 放整理后的面试输出，`wiki/index.md` 是状态源，`wiki/log.md` 只追加。

## 使用原则

- 每个主题都要服务面试表达：能回答“是什么、为什么、怎么做、有什么坑、项目里怎么体现”。
- 学习材料先进入 `raw/`，沉淀后的结构化内容再进入 `wiki/`。
- 主题页有实质更新时，同步更新本页状态和说明。
- 学习或准备过程写入 [log.md](log.md)，只追加，不重写历史。

## 优先级路线

1. Agent Loop 与 Harness 工程
2. Tool Calling / MCP / 权限
3. Memory / Context / RAG
4. Eval / Observability
5. Multi-Agent / Planning / 系统设计
6. 项目故事与问题索引

## 主题目录

| 页面 | 状态 | 面试用途 |
|------|------|----------|
| [llm-foundation.md](llm-foundation.md) | 🟡 进行中 | 解释 LLM 基础、上下文、结构化输出和模型能力边界 |
| [agent-loop.md](agent-loop.md) | 🟡 进行中 | 准备 Agent Loop、状态机、终止条件、错误恢复、流式执行 |
| [harness-engineering.md](harness-engineering.md) | 🟡 进行中 | 准备 Harness、任务编排、评测驱动、轨迹回放 |
| [tool-calling.md](tool-calling.md) | 🟡 进行中 | 准备 Tool Calling、MCP、工具 schema、权限和执行协议 |
| [memory-context.md](memory-context.md) | 🟡 进行中 | 准备记忆、上下文工程、压缩、检索和缓存 |
| [planning-reasoning.md](planning-reasoning.md) | 🟡 进行中 | 准备 ReAct、Planning、Reflection、搜索和失败恢复 |
| [rag-retrieval.md](rag-retrieval.md) | 🟡 进行中 | 准备 RAG、hybrid search、rerank、引用和忠实度 |
| [eval-observability.md](eval-observability.md) | 🟡 进行中 | 准备 eval、trace、成本、延迟、质量回归和线上监控 |
| [multi-agent.md](multi-agent.md) | 🟡 进行中 | 准备 supervisor、worker、critic、多智能体通信和合并 |
| [safety-permissions.md](safety-permissions.md) | 🟡 进行中 | 准备权限系统、沙箱、注入攻击和数据泄露防护 |
| [system-design.md](system-design.md) | 🟡 进行中 | 准备 AI Agent 系统设计题和架构拆解 |
| [project-stories.md](project-stories.md) | 🟡 进行中 | 准备项目复盘、STAR 叙事和深挖回答 |
| [question-index.md](question-index.md) | 🟡 进行中 | 汇总高频问题并反链到专题页 |

## 原始材料索引

| 源文件 | 说明 |
|--------|------|
| [interview-roadmap.md](../raw/interview-roadmap.md) | LLM 与 AI Agent 工程面试路线 |
| [question-bank.md](../raw/question-bank.md) | 原始问题池 |
| [project-inventory.md](../raw/project-inventory.md) | 项目素材清单 |

## 状态图例

- 🟡 进行中：已有骨架，后续需要按问题和项目继续深化。
- 🟢 完成：核心概念、工程实现、面试题、追问和项目表达已覆盖。
- ⬜ 待开始：还没有有效内容。
