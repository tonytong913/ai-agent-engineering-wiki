#!/usr/bin/env bash
set -euo pipefail

rm -rf site-docs
mkdir -p site-docs
cp -R wiki site-docs/wiki
cp -R raw site-docs/raw
cat > site-docs/index.md <<'EOF'
# LLM 与 AI Agent 工程能力 Wiki

正在进入 [Wiki 首页](wiki/index.md)。

<meta http-equiv="refresh" content="0; url=wiki/">
EOF
