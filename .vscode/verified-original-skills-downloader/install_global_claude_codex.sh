#!/usr/bin/env bash
set -euo pipefail

command -v npx >/dev/null 2>&1 || {
  echo "npx is required. Install Node.js/npm first." >&2
  exit 1
}

COMMON=(-g -a claude-code -a codex -y)

npx skills add https://github.com/mattpocock/skills \
  --skill domain-modeling \
  --skill codebase-design \
  --skill code-review \
  "${COMMON[@]}"

npx skills add https://github.com/shadcn-ui/ui \
  --skill shadcn \
  "${COMMON[@]}"

npx skills add https://github.com/emilkowalski/skills \
  --skill emil-design-eng \
  "${COMMON[@]}"

npx skills add https://github.com/cursor/plugins \
  --skill thermo-nuclear-code-quality-review \
  "${COMMON[@]}"

echo "Verified public skills installed globally for Claude Code and Codex."
echo "feature-orchestrator was not installed because its exact upstream is unverified."
