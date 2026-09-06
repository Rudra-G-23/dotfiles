## Codex CLI

Shared agent skills are tracked in `codex/skills/`. Claude Code reads the same
library through `.claude/skills`, which is a symlink to `codex/skills`.

When installing the dotfiles globally, link `codex/skills` into
`~/.codex/skills/` so both agents use one physical skill library. In a normal
project checkout, this library can instead be placed at `.agents/skills` and
the Claude link changed to `../.agents/skills`.

- `grill-me` — structured rounds for stress-testing plans and decisions
- `quick-ans` — concise answers with a brief explanation
- `shared-skill-library` — maintains the shared Codex and Claude Code skill links

Verified upstream skills are stored in
`.vscode/verified-original-skills-downloader/original-skills/` and exposed here
through relative symlinks:

- `domain-modeling` — maintains project terminology, context, and ADRs
- `codebase-design` — designs deep, testable modules and clean seams
- `code-review` — checks diffs against repository standards and specifications
- `shadcn` — manages shadcn/ui components and composition
- `emil-design-eng` — improves UI polish, component design, and animation
- `thermo-nuclear-code-quality-review` — runs an exceptionally strict quality review

Every skill has `disable-model-invocation: true`, so it runs only when the user
explicitly invokes it.

Command execution rules are tracked in `rules/default.rules` and installed as
`~/.codex/rules/default.rules`. Risky Git operations, including `git pull`, are
forbidden for Codex.
