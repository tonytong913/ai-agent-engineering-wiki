# MkDocs Material GitHub Pages Design

## Goal

Publish the existing Chinese AI Agent interview wiki as a browser-friendly documentation site using MkDocs Material and GitHub Pages.

## Deployment Choice

Use GitHub Actions automatic deployment instead of manual `mkdocs gh-deploy`.

Reasons:

- The repository stays source-only; generated HTML is uploaded as a Pages artifact.
- Every push to the default branch can build and publish the site.
- The workflow follows the current GitHub Pages artifact model with `configure-pages`, `upload-pages-artifact`, and `deploy-pages`.

## Site Structure

Keep the existing content layout:

- `wiki/` remains the main documentation section.
- `raw/` remains visible as source material.
- `docs/superpowers/` remains internal process documentation and is excluded from the public site.

MkDocs requires `docs_dir` to be a child directory of the config file location, so the build uses a generated `site-docs/` staging directory. A small preparation script copies `wiki/` and `raw/` into `site-docs/` before each build. This preserves the root `wiki/` and `raw/` source layout while giving MkDocs a valid documentation root.

## Files To Add

- `mkdocs.yml`: site metadata, Material theme, navigation, search, Markdown extensions, and exclusions.
- `requirements.txt`: Python dependencies for local and CI builds.
- `.github/workflows/pages.yml`: GitHub Pages build and deploy workflow.
- `.gitignore`: ignore generated `site/` output and local Python build artifacts.
- `scripts/prepare-mkdocs-docs.sh`: rebuild the ignored `site-docs/` staging directory from `wiki/` and `raw/`.

## Navigation

The site navigation should expose:

1. Wiki 首页
2. 核心专题
3. 面试输出
4. 原始材料

The first page should be `wiki/index.md`.

## Verification

Before committing:

- Run a local MkDocs build with strict mode when dependencies are available.
- Check generated site output is not committed.
- Confirm Git status contains only source/configuration changes.

## GitHub Setup Note

After pushing to GitHub, the repository's Pages source should be set to GitHub Actions. The workflow itself builds the site and deploys the uploaded artifact.
