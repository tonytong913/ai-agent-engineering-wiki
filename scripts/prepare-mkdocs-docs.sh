#!/usr/bin/env bash
set -euo pipefail

rm -rf site-docs
mkdir -p site-docs
cp -R wiki site-docs/wiki
cp -R raw site-docs/raw
