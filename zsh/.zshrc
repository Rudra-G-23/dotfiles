# ---------- Starship ----------
eval "$(starship init zsh)"

# ---------- zoxide ----------
eval "$(zoxide init zsh)"

# ---------- fzf ----------
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# ---------- Autosuggestions ----------
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---------- Syntax Highlighting ----------
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------- Aliases ----------

# For System 
alias c="clear"

# For eza
alias ls="eza"
alias ll="eza -la"
alias tree="eza --tree"

# For git
alias gc= "git clone"
alias gs="git status"
alias glog="git log --oneline --graph --decorate -n 5"

alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -m"

alias gp="git push"
alias gpl="git pull"

alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"

# Virtual Environment
alias venv="python -m venv .venv"
alias act="source .venv/bin/activate"
alias deact="deactivate"

# For UV
alias uvs="uv sync"
alias uva="uv add"
alias uvr="uv remove"

# For VS
alias cdp="cd ~/projects"