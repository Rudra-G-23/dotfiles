# ==============================================================================
# ZSH CONFIGURATION
# ==============================================================================

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------
# Beautiful, fast shell prompt
eval "$(starship init zsh)"

# ------------------------------------------------------------------------------
# Smart Directory Navigation
# ------------------------------------------------------------------------------
# Jump to frequently used directories
eval "$(zoxide init zsh)"


# ------------------------------------------------------------------------------
# npm & nvm
# ------------------------------------------------------------------------------
export PATH="$HOME/.npm-global/bin:$PATH"
export NVM_DIR="$HOME/.nvm"

# Load NVM and its completions if they exist
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ------------------------------------------------------------------------------
# FZF (Fuzzy Finder)
# ------------------------------------------------------------------------------
# Ctrl+R -> Search history
# Ctrl+T -> Find files
# Alt+C  -> Jump to directories
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# ------------------------------------------------------------------------------
# Zsh Plugins
# ------------------------------------------------------------------------------

# Shows command suggestions as you type
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Highlights valid/invalid commands
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ==============================================================================
# ALIASES
# ==============================================================================

# ------------------------------------------------------------------------------
# System
# ------------------------------------------------------------------------------
alias c="clear"
alias reload="source ~/.zshrc"
alias update="sudo apt update && sudo apt upgrade"
alias clean="sudo apt autoremove && sudo apt autoclean"

# ------------------------------------------------------------------------------
# Better ls (eza)
# ------------------------------------------------------------------------------
alias ls="eza"
alias ll="eza -lah --icons"
alias la="eza -a"
alias lt="eza --tree --level=2 --icons"

# ------------------------------------------------------------------------------
# Navigation
# ------------------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Open VS code 
alias vs="code ."

# My fav folders
alias pro="cd ~/projects"
alias test="cd ~/test"
alias learn="cd ~/learn"
alias open="cd ~/open"
alias work="cd ~/work"

# Go Home
alias home="cd ~"

# ------------------------------------------------------------------------------
# Git
# ------------------------------------------------------------------------------

alias gc="git clone"
alias gf="git fetch"

alias gs="git status -s -b"
alias gd="git diff"

alias glog="git log --graph --all --pretty=format:'%C(auto)%h%d %s %C(green)(%cr) %C(bold blue)<%an>%Creset' -n 10"

alias ga="git add"
alias gaa="git add ."

alias gcm="git commit -m"

alias gps="git push"
alias gpl="git pull"

alias gb="git branch"

alias gco="git checkout"
alias gcb="git checkout -b"

# ------------------------------------------------------------------------------
# Python Virtual Environment
# ------------------------------------------------------------------------------
alias venv="python -m venv .venv"
alias act="source .venv/bin/activate"
alias deact="deactivate"

# ------------------------------------------------------------------------------
# UV Package Manager
# ------------------------------------------------------------------------------
alias uvs="uv sync"
alias uva="uv add"
alias uvr="uv remove"

# ==============================================================================
# TERMINAL KEYBINDINGS | ctrl + Arrow / Delete Key Bindings (WezTerm)
# ==============================================================================

autoload -U select-word-style
select-word-style bash

# Ctrl + Left
bindkey '^[[1;5D' backward-word

# Ctrl + Right
bindkey '^[[1;5C' forward-word

# Ctrl + Backspace
bindkey '^H' backward-kill-word

# Ctrl + Delete
bindkey '^[[3;5~' kill-word
. "$HOME/.local/bin/env"