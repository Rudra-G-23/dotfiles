# fzf (Fuzzy Finder)

This is a highly useful terminal tool for finding files, history, and more.

## What does it do?

Press `Ctrl + R` to get a searchable popup of your command history. Type a keyword, and it instantly finds matching commands.

It also searches:
* Files
* Directories
* Git branches
* Processes
* Anything

## Install

```bash
sudo apt install fzf -y
```

## Verify

```bash
fzf --version
```

## Enable

Ubuntu's package usually includes shell integration.

Run:

```bash
ls /usr/share/doc/fzf/examples
```

If you see files like `key-bindings.zsh` and `completion.zsh`, add these **before** `zsh-syntax-highlighting` in your `.zshrc`:

```bash
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
```

Reload:

```bash
source ~/.zshrc
```

## Test

Press `Ctrl + R`. A fuzzy history search should appear.
