---
name: shared-skill-library
description: Maintain the shared Codex and Claude Code skill library in this dotfiles repository.
disable-model-invocation: true
---

Keep `codex/skills` as the canonical skill library.

Claude Code must resolve its skills directory to this library through `.claude/skills` in the repository and `~/.claude/skills` globally. Codex must resolve each installed skill in `~/.codex/skills` to the same library.

Verified third-party source folders remain under `.vscode/verified-original-skills-downloader/original-skills/`. Expose them from `codex/skills` with relative symlinks; do not duplicate or modify their upstream contents.

Every locally maintained shared skill must include `disable-model-invocation: true` so only the user can invoke it. Preserve `user-invocable: true` where it is explicitly set. Do not add this metadata to verified upstream skills; preserve those sources exactly.

Before changing links, verify their resolved paths. Afterward, verify that every intended skill resolves to a directory containing `SKILL.md` for both Codex and Claude Code.
