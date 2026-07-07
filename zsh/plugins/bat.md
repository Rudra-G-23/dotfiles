# bat

bat is a clone of `cat` with syntax highlighting and Git integration.

## Install

```bash
sudo apt install bat -y
```

On Ubuntu, the executable is named `batcat`.

## Enable (Alias)

Create an alias in your `.zshrc`:

```bash
alias bat="batcat"
```

Reload:

```bash
source ~/.zshrc
```

## Test

```bash
bat ~/.zshrc
```
