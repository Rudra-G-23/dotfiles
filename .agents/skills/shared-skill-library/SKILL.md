---
name: shared-skill-library
description: Maintain the shared Codex and Claude Code skill library in this dotfiles repository.
disable-model-invocation: true
---

Keep `.agents/skills` as the canonical skill library.

Claude Code must resolve its skills directory to this library through
`.claude/skills` in the repository and `~/.claude/skills` globally. Codex must
resolve each installed skill in `~/.codex/skills` to the same library.

Verified third-party source folders remain under
`.vscode/verified-original-skills-downloader/original-skills/` when present.
Expose them from `.agents/skills` with relative symlinks; do not duplicate or
modify their upstream contents.

Every locally maintained shared skill must include `disable-model-invocation: true` so only the user can invoke it. Preserve `user-invocable: true` where it is explicitly set. Do not add this metadata to verified upstream skills; preserve those sources exactly.

The one exception is a skill deliberately designed for automatic invocation (the agent decides to run it from its `description`, with no explicit user command) - such a skill must omit `disable-model-invocation` entirely, and its `description` must state precisely what triggers it and what does not, since that description is the only thing standing in for a user's explicit invocation. `change-report` is the current example: it triggers on completing a non-trivial feature, bug fix, or refactor, and explicitly excludes small work (a commit, a typo fix, a config tweak).

Before changing links, verify their resolved paths. Afterward, verify that every intended skill resolves to a directory containing `SKILL.md` for both Codex and Claude Code.
