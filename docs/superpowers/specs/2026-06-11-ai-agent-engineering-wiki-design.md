# AI Agent Engineering Wiki Design

## Goal

Build a local career-preparation wiki for LLM and AI Agent engineering roles, with emphasis on Agent Loop engineering, Harness engineering, tool use, evaluation, observability, memory/context systems, and production agent architecture.

The wiki should follow the same operating model as the existing `agents-learning` wiki:

- `raw/` stores original source material, roadmaps, question pools, and project inventory.
- `wiki/index.md` is the main navigation and status source.
- `wiki/log.md` is append-only and records preparation sessions.
- Topic pages under `wiki/` turn raw material into discussion-ready explanations.

## Audience And Use

The primary user is preparing for roles such as:

- LLM application engineer
- AI Agent engineer
- Agent runtime / harness engineer
- Agent loop / tool orchestration engineer
- RAG, evaluation, and observability engineer

The wiki is not a generic computer-science notebook. Each page should help answer technical questions, handle follow-up questions, and connect concepts to concrete engineering stories.

## Structure

Initial file layout:

```text
raw/
  engineering-roadmap.md
  question-bank.md
  project-inventory.md

wiki/
  index.md
  log.md
  llm-foundation.md
  agent-loop.md
  harness-engineering.md
  tool-calling.md
  memory-context.md
  planning-reasoning.md
  rag-retrieval.md
  eval-observability.md
  multi-agent.md
  safety-permissions.md
  system-design.md
  project-stories.md
  question-index.md
```

## Topic Page Template

Each topic page should use this structure:

1. Discussion Positioning
2. Core Concepts
3. Engineering Implementation
4. Common Technical Questions
5. Follow-up Questions
6. Project Story Hooks
7. Source / Paper / Reference Index
8. Open Questions

This keeps notes tied to career output instead of becoming passive study material.

## Index Responsibilities

`wiki/index.md` should be the authority for:

- Topic status: pending, in progress, complete
- Topic description
- Priority order
- Links to topic pages
- Links to raw source material

When a topic page changes meaningfully, the index should be updated in the same edit.

## Log Responsibilities

`wiki/log.md` should be append-only. It should record:

- Date
- Preparation theme
- Files or topics touched
- Discussion summary
- Output created
- Next step

Existing entries should not be rewritten except for obvious formatting fixes.

## Raw Material Responsibilities

`raw/engineering-roadmap.md` is the source learning route.

`raw/question-bank.md` stores unprocessed questions, categorized by topic. Questions can later be promoted into topic pages and `wiki/question-index.md`.

`raw/project-inventory.md` stores project material and experience fragments that can be shaped into project stories.

## Initial Scope

The first implementation should create the wiki skeleton and seed each page with concise starter content. It should not attempt to fully answer every question.

Priority should be:

1. Make the directory navigable.
2. Establish the status and logging rules.
3. Seed the AI Agent engineering topic map.
4. Leave clear placeholders for later deep dives.

## Verification

After implementation:

- Confirm all links in `wiki/index.md` point to files that exist.
- Confirm `wiki/log.md` has one initial entry.
- Confirm the raw files exist and are linked from the index.
- Run a basic Markdown sanity check using shell tools available in the environment.
