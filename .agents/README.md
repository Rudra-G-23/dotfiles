## Codex CLI

This repository uses `.agents/skills/` as the single source of truth for shared
Codex and Claude Code skills. Claude Code reads it through `.claude/skills`,
which is a symlink to `../.agents/skills`.

The global setup is connected to this repository as follows:

```text
~/.agents/skills
    -> /home/rudra/test/dotfiles/.agents/skills

~/.codex/skills/<skill>
    -> /home/rudra/test/dotfiles/.agents/skills/<skill>

~/.claude/skills
    -> ~/.agents/skills
```

Both agents therefore use the same physical skill files. Do not maintain
separate copies under `~/.codex/skills` or `~/.claude/skills`.

The root-level links were repaired after the old `codex/skills` target was
removed. Broken links to unavailable upstream skills were removed from
`~/.codex/skills`; only skills that resolve to a directory containing
`SKILL.md` are kept there.

Currently maintained shared skills:

- `change-report` - reports non-trivial code changes automatically
- `grill-me` - structured rounds for stress-testing plans and decisions
- `quick-ans` - concise answers with a brief explanation
- `shared-skill-library` - maintains the Codex and Claude Code skill links

Locally maintained skills use `disable-model-invocation: true` when they should
run only after explicit user invocation. `change-report` is the exception: its
description allows automatic use after a non-trivial feature, bug fix, or
refactor.

If this repository moves, repair the three global links above. Verify them with:

```bash
for skill in ~/.codex/skills/*; do
  test -f "$skill/SKILL.md" || echo "broken: $skill"
done
test -f ~/.claude/skills/change-report/SKILL.md
```

Command execution rules are tracked in `rules/default.rules` and installed as
`~/.codex/rules/default.rules`. Risky Git operations, including `git pull`,
are forbidden for Codex.
