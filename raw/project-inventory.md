# 项目素材清单

> 用于沉淀可在面试中讲述的项目故事。每个项目都要能对应到一个或多个 AI Agent 工程能力点。

## 项目记录模板

### 项目名称

**一句话定位**：

**业务或工程问题**：

**我的职责**：

**核心约束**：

**方案设计**：

**关键取舍**：

**指标结果**：

**失败或事故**：

**复盘改进**：

**可关联专题**：

- Agent Loop
- Harness 工程
- Tool Calling
- Memory / Context
- RAG
- Eval / Observability
- Safety / Permissions
- System Design

## 候选项目方向

### Agent Runtime / Loop

- 重点表达：状态机、工具调用、终止条件、错误恢复、流式执行。
- 可追问：如何防止无限循环，如何做幂等，如何处理工具部分失败。

### Agent Harness / Eval

- 重点表达：任务集、轨迹采集、自动评分、回归测试、可复现实验。
- 可追问：如何选择 golden set，如何处理 judge 偏差，如何定位失败来源。

### MCP / Tool Platform

- 重点表达：工具注册、schema、权限、执行协议、动态发现。
- 可追问：如何治理高风险工具，如何做工具版本兼容。

### RAG / Knowledge Agent

- 重点表达：检索链路、上下文构造、引用、忠实度评估。
- 可追问：如何提升召回，如何避免幻觉，如何处理权限文档。

### Observability / Cost Control

- 重点表达：trace、token、latency、cost、错误归因、质量监控。
- 可追问：如何定义指标，如何发现回归，如何做线上告警。
