# dotfiles

Personal setup notes and config for a WSL2 + Ubuntu + Zsh + WezTerm + VS Code environment.

## Bootstrap order

1. [`wsl/`](wsl) — install WSL2, VS Code's WSL extension, folder layout
2. [`zsh/`](zsh) — shell (`.zshrc`), Starship prompt, plugins
3. [`wezterm/`](wezterm) — terminal emulator config
4. [`fonts/`](fonts) — font & theme used across VS Code and the terminal
5. [`vscode/`](vscode) — editor settings, per-repo overrides, saved profiles
6. [`git/`](git) — git identity and SSH setup for GitHub
7. [`python/`](python) — pyenv-based Python setup

## Tools

- [`docker/`](docker) — Docker on WSL notes
- [`ollama/`](ollama) — local LLMs via Ollama, incl. VS Code autocompletion setup
- [`claude/`](claude) — Claude Code settings reference
- [`herdr/`](herdr) — multi-agent terminal tool
- [`codex/skills/`](codex/skills) — shared, user-invoked skills for Codex and Claude Code
