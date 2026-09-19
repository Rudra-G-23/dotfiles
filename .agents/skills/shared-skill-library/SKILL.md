---
name: shared-skill-library
description: Maintain the shared Codex and Claude Code skill library in this dotfiles repository.
---

Keep `.agents/skills` as the canonical skill library.

Claude Code must resolve its skills directory to this library through
`.claude/skills` in the repository and `~/.claude/skills` globally. Codex must
resolve each installed skill in `~/.codex/skills` to the same library.

Verified third-party source folders remain under
`.vscode/verified-original-skills-downloader/original-skills/` when present.
Expose them from `.agents/skills` with relative symlinks; do not duplicate or
modify their upstream contents.

All shared skills must omit `disable-model-invocation` so agents can invoke them automatically from their descriptions. Preserve `user-invocable: false` where a skill should be agent-only. Verified upstream sources should otherwise remain unchanged; when the user explicitly requests automatic invocation for every skill, remove only this invocation blocker from the linked source.

Before changing links, verify their resolved paths. Afterward, verify that every intended skill resolves to a directory containing `SKILL.md` for both Codex and Claude Code.
