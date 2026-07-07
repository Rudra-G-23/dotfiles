# Zsh Autosuggestions

Ubuntu already has this package.

## Install

```bash
sudo apt install zsh-autosuggestions -y
```

## Verify installation

Run:

```bash
dpkg -L zsh-autosuggestions
```

You should see something like: `/usr/share/zsh-autosuggestions/`

## Enable it

Open your `.zshrc`:

```bash
nano ~/.zshrc
```

Add this below the Starship line:

```bash
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

Save: `Ctrl + O`, `Enter`, `Ctrl + X`

Reload:

```bash
source ~/.zshrc
```

## Test it

Run:

```bash
git status
```

Now press `Up Arrow`, then clear the line.
Now type: `git`

You should see a gray suggestion. If not, it learns from your history as you use the terminal more.

## How to disable

Comment out the line in `.zshrc`:

```bash
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

Then reload.

## How to uninstall

Remove the source line from `.zshrc`, then:

```bash
sudo apt remove zsh-autosuggestions
sudo apt autoremove
```
