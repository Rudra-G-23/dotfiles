# Verified original skills from the screenshot

This bundle maps the public skills visible in `skills.jpg` to their verified upstream repositories and provides scripts that fetch the **original folders directly from those repositories**.

Verified mappings:

- `domain-modeling` -> `mattpocock/skills` (`skills/engineering/domain-modeling`)
- `codebase-design` -> `mattpocock/skills` (`skills/engineering/codebase-design`)
- `code-review` -> `mattpocock/skills` (`skills/engineering/code-review`)
- `shadcn` -> `shadcn-ui/ui` (`skills/shadcn`)
- `emil-design-eng` -> `emilkowalski/skills` (`skills/emil-design-eng`)
- Screenshot label `nuclear-code-review` -> best verified match is Cursor's `thermo-nuclear-code-quality-review` in `cursor/plugins`

## About `feature-orchestrator`

The screenshot labels this as **"my skill - orchestration"**, which strongly indicates a custom/private skill. Public repositories contain similarly named skills, but there is not enough evidence to claim any of them is the exact skill shown. It is intentionally not substituted with an unverified copy.

## Use in WSL

To download the original upstream folders into a normal folder and make a ZIP:

```bash
chmod +x download_originals.sh
./download_originals.sh
```

Output:

- `original-skills/`
- `original-skills.zip`

To install the verified skills globally for both Claude Code and Codex using the Skills CLI:

```bash
chmod +x install_global_claude_codex.sh
./install_global_claude_codex.sh
```

Review third-party skills before enabling them. The scripts do not add or invent skill content.
