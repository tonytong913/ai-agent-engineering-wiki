# MkDocs Pages Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Configure the engineering wiki as a MkDocs Material site deployable to GitHub Pages.

**Architecture:** Keep `wiki/` and `raw/` in place as source files. Copy them into an ignored `site-docs/` staging directory before each build, set MkDocs `docs_dir` to `site-docs`, build static HTML into `site/`, and publish with GitHub Pages artifact deployment.

**Tech Stack:** MkDocs, Material for MkDocs, GitHub Actions, GitHub Pages.

---

### Task 1: Add MkDocs Site Configuration

**Files:**
- Create: `mkdocs.yml`
- Create: `.gitignore`
- Create: `requirements.txt`
- Create: `scripts/prepare-mkdocs-docs.sh`

- [ ] **Step 1: Create `mkdocs.yml`**

Add site metadata, Material theme, navigation, Markdown extensions, `docs_dir: site-docs`, and `site_dir: site`.

- [ ] **Step 2: Create `requirements.txt`**

Add `mkdocs-material` as the build dependency.

- [ ] **Step 3: Create `.gitignore`**

Ignore generated site output, generated staging docs, and Python local environment files.

- [ ] **Step 4: Create `scripts/prepare-mkdocs-docs.sh`**

Add a script that recreates `site-docs/` from `wiki/` and `raw/`.

### Task 2: Add GitHub Pages Workflow

**Files:**
- Create: `.github/workflows/pages.yml`

- [ ] **Step 1: Create workflow**

Add a workflow triggered by pushes to `master` and manual dispatch.

- [ ] **Step 2: Build job**

Checkout source, set up Python, install dependencies, run `scripts/prepare-mkdocs-docs.sh`, run `mkdocs build --strict`, configure Pages, and upload `site/`.

- [ ] **Step 3: Deploy job**

Deploy the uploaded artifact with `actions/deploy-pages`.

### Task 3: Verify Build

**Files:**
- Read: `mkdocs.yml`
- Read: `.github/workflows/pages.yml`

- [ ] **Step 1: Check configuration files**

Run: `git diff --check`

Expected: no whitespace errors.

- [ ] **Step 2: Run local build**

Run: `mkdocs build --strict`

Expected: site builds successfully into `site/`.

- [ ] **Step 3: Confirm generated output is ignored**

Run: `git status --short`

Expected: `site/` does not appear as untracked.

### Task 4: Commit

**Files:**
- Add: `mkdocs.yml`
- Add: `.gitignore`
- Add: `requirements.txt`
- Add: `.github/workflows/pages.yml`
- Add: `scripts/prepare-mkdocs-docs.sh`
- Add: `docs/superpowers/plans/2026-06-11-mkdocs-pages.md`

- [ ] **Step 1: Stage files**

Run: `git add mkdocs.yml .gitignore requirements.txt .github/workflows/pages.yml scripts/prepare-mkdocs-docs.sh docs/superpowers/plans/2026-06-11-mkdocs-pages.md docs/superpowers/specs/2026-06-11-mkdocs-pages-design.md`

Expected: files staged.

- [ ] **Step 2: Commit**

Run: `git commit -m "docs: configure MkDocs Material Pages site"`

Expected: commit succeeds.
