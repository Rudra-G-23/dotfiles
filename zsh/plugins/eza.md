# eza

eza is a modern replacement for `ls`. It includes git status, file permissions, icons, and better colors.

## Install

For Ubuntu 24.04:

```bash
sudo apt install eza -y
```

## Verify

```bash
eza --version
```

## Enable (Aliases)

Add these aliases to your `.zshrc`:

```bash
alias ls="eza"
alias ll="eza -la"
alias tree="eza --tree"
```

Reload:

```bash
source ~/.zshrc
```

## Test

```bash
ll
```
