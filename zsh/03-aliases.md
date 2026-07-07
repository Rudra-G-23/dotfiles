# Aliases

## 1. Directory Navigation

```zsh
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ~="cd ~"
alias c="clear"
alias h="history"
alias q="exit"
```

---

## 2. Modern `ls` (using `eza`)

If you've installed `eza`:

```zsh
alias ls="eza"
alias ll="eza -lh"
alias la="eza -lah"
alias lt="eza --tree"
alias l="eza -lah --icons"
```

Useful examples:

```bash
ll
```

Shows:

```
Permissions  Size  Date  File
```

```bash
lt
```

Shows:

```
project
├── src
├── data
├── models
└── notebooks
```

---

## 3. Git Aliases (Most Important)

These are widely used and easy to remember.

```zsh
alias g="git"

alias gs="git status"
alias ga="git add"
alias gaa="git add ."

alias gc="git commit"
alias gcm="git commit -m"

alias gp="git push"
alias gpl="git pull"

alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"

alias gd="git diff"
alias gl="git log --oneline --graph --decorate"

alias gr="git restore"

alias gf="git fetch"

alias gcl="git clone"
```

Example workflow:

```bash
gs
gaa
gcm "Add feature engineering"
gp
```

---

## 4. Python

```zsh
alias py="python"
alias python="python3"

alias pip="pip3"

alias ipy="ipython"

alias jn="jupyter notebook"
alias jl="jupyter lab"
```

---

## 5. Virtual Environment

```zsh
alias venv="python -m venv .venv"

alias act="source .venv/bin/activate"

alias deact="deactivate"
```

---

## 6. UV (Recommended)

If you're using `uv`:

```zsh
alias uvp="uv pip"
alias uvs="uv sync"
alias uva="uv add"
alias uvr="uv run"
```

---

## 7. ML / Data Science

```zsh
alias nb="jupyter notebook"

alias lab="jupyter lab"

alias tensorboard="tensorboard --logdir=runs"

alias kag="kaggle"
```

---

## 8. System

```zsh
alias update="sudo apt update && sudo apt upgrade"

alias clean="sudo apt autoremove && sudo apt autoclean"

alias df="df -h"

alias free="free -h"

alias ports="ss -tulnp"
```

---

## 9. Process Monitoring

If you installed `btop`:

```zsh
alias top="btop"
```

---

## 10. VS Code

```zsh
alias code.="code ."

alias cdp="cd ~/projects"
```

Now:

```bash
cdp
code.
```

opens your projects directory directly in VS Code.

---

## 11. Docker (Future)

```zsh
alias d="docker"

alias dc="docker compose"

alias dps="docker ps"

alias di="docker images"

alias dex="docker exec -it"

alias dlog="docker logs"
```

---

## 12. Conda (If You Ever Use It)

```zsh
alias ca="conda activate"

alias ce="conda env list"
```

---

## 13. Safer File Operations

These prevent accidental deletion or overwriting.

```zsh
alias rm="rm -i"

alias cp="cp -i"

alias mv="mv -i"
```

---

# Recommended `.zsh_aliases`

```zsh
# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"

# eza
alias ls="eza"
alias ll="eza -lh"
alias la="eza -lah"
alias lt="eza --tree"

# Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate"
alias gr="git restore"
alias gf="git fetch"
alias gcl="git clone"

# Python
alias py="python"
alias python="python3"
alias pip="pip3"
alias ipy="ipython"

# Jupyter
alias nb="jupyter notebook"
alias lab="jupyter lab"

# Virtual Environment
alias venv="python -m venv .venv"
alias act="source .venv/bin/activate"
alias deact="deactivate"

# System
alias update="sudo apt update && sudo apt upgrade"
alias clean="sudo apt autoremove && sudo apt autoclean"

# Monitor
alias top="btop"

# VS Code
alias code.="code ."
alias cdp="cd ~/projects"
```

