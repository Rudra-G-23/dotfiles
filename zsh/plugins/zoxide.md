# zoxide

Zoxide is a smarter `cd` command. It remembers which directories you use most frequently, so you can jump to them in just a few keystrokes.

## Install

```bash
sudo apt install zoxide -y
```

## Verify

```bash
zoxide --version
```

## Enable

Add to `.zshrc`:

```bash
eval "$(zoxide init zsh)"
```

Place it **before** syntax highlighting.

Reload:

```bash
source ~/.zshrc
```

## Test

Visit folders normally:

```bash
cd ~/Downloads
cd ~
cd ~/Downloads
```

Then try jumping back with zoxide:

```bash
z Down
```

It should jump there instantly.
