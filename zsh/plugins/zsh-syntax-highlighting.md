# Zsh Syntax Highlighting

This plugin colors commands before you press Enter. This immediately catches typos.

## Install

```bash
sudo apt install zsh-syntax-highlighting -y
```

## Verify

```bash
dpkg -L zsh-syntax-highlighting
```

Expected: `/usr/share/zsh-syntax-highlighting/`

## Enable it

Open `.zshrc`:

```bash
nano ~/.zshrc
```

Add this at the very bottom:

```bash
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

**Important**: `zsh-syntax-highlighting` should be the last plugin sourced in `.zshrc`. Loading it last ensures it can correctly highlight commands after all other plugins have modified the command line.

Reload:

```bash
source ~/.zshrc
```

## Test it

Type without pressing Enter:

```bash
git status
```

It should be highlighted in green as a valid command.

Type:

```bash
gittt status
```

The command name should turn red because it doesn't exist.

## How to disable

Comment out the line in `.zshrc`:

```bash
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

Then reload.

## How to uninstall

Remove the source line from `.zshrc`, then:

```bash
sudo apt remove zsh-syntax-highlighting
sudo apt autoremove
```
