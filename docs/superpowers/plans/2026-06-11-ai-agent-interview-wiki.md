# AI Agent 面试 Wiki Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 初始化一个面向 LLM 与 AI Agent 工程面试准备的中文 wiki。

**Architecture:** 使用 `raw/` 保存原始路线、题库和项目素材，使用 `wiki/` 保存面试输出型知识页。`wiki/index.md` 作为状态源，`wiki/log.md` 作为追加式准备日志。

**Tech Stack:** Markdown、Git、shell link sanity check。

---

### Task 1: 初始化 Git 仓库

**Files:**
- Modify: `.git/`

- [ ] **Step 1: 检查当前 Git 状态**

Run: `git status --short`

Expected: 如果目录尚未初始化，命令返回 `fatal: not a git repository`。

- [ ] **Step 2: 初始化仓库**

Run: `git init`

Expected: 输出包含 `Initialized empty Git repository` 或 `Reinitialized existing Git repository`。

### Task 2: 创建原始材料目录

**Files:**
- Create: `raw/interview-roadmap.md`
- Create: `raw/question-bank.md`
- Create: `raw/project-inventory.md`

- [ ] **Step 1: 创建 `raw/interview-roadmap.md`**

写入 AI Agent 工程面试路线，覆盖 LLM 基础、Agent Loop、Harness、Tool Calling、Memory、Planning、RAG、Eval、Multi-Agent、安全权限、系统设计和项目表达。

- [ ] **Step 2: 创建 `raw/question-bank.md`**

写入按专题分类的初始问题池。

- [ ] **Step 3: 创建 `raw/project-inventory.md`**

写入项目经历素材模板，服务于面试中的项目深挖。

### Task 3: 创建 Wiki 目录和主题页

**Files:**
- Create: `wiki/index.md`
- Create: `wiki/log.md`
- Create: `wiki/llm-foundation.md`
- Create: `wiki/agent-loop.md`
- Create: `wiki/harness-engineering.md`
- Create: `wiki/tool-calling.md`
- Create: `wiki/memory-context.md`
- Create: `wiki/planning-reasoning.md`
- Create: `wiki/rag-retrieval.md`
- Create: `wiki/eval-observability.md`
- Create: `wiki/multi-agent.md`
- Create: `wiki/safety-permissions.md`
- Create: `wiki/system-design.md`
- Create: `wiki/project-stories.md`
- Create: `wiki/question-index.md`

- [ ] **Step 1: 创建 `wiki/index.md`**

写入总入口、主题状态表、优先级和原始材料索引。

- [ ] **Step 2: 创建 `wiki/log.md`**

写入第一条初始化日志，并声明 append-only 规则。

- [ ] **Step 3: 创建主题页**

每个主题页使用统一结构：面试定位、核心概念、工程实现、常见问题、追问点、项目表达、资料索引、开放问题。

### Task 4: 验证和提交

**Files:**
- Read: `wiki/index.md`
- Read: linked files

- [ ] **Step 1: 检查 index 链接指向真实文件**

Run: `rg -o "\\[[^]]+\\]\\(([^)]+)\\)" wiki/index.md`

Expected: 每个相对链接对应的文件都存在。

- [ ] **Step 2: 检查 Markdown 基础形态**

Run: `rg -n "待补充|待定|未完成" raw wiki`

Expected: 无未处理占位符。

- [ ] **Step 3: 查看 Git 状态**

Run: `git status --short`

Expected: 显示新增的 `raw/`、`wiki/`、`docs/superpowers/` 文件。

- [ ] **Step 4: 创建初始提交**

Run:

```bash
git add raw wiki docs/superpowers
git commit -m "docs: initialize AI Agent interview wiki"
```

Expected: 提交成功。
