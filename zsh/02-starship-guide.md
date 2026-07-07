# Starship Guide

## Your Workflow

1. Open WezTerm in Windows.
2. It starts Ubuntu (WSL).
3. You will see a prompt like `rudra@LAPTOP-XXXX:~$` or `>`.
4. Run all Linux commands here.

To begin setting up Starship, open WezTerm. If it doesn't automatically open Ubuntu, type:

```bash
wsl
```

Make sure you're in Ubuntu by running:

```bash
echo $SHELL
```

You should see something like `/usr/bin/zsh`.

## What is Starship?

Starship is a prompt customization tool. It controls what you see before you type commands.

Without Starship: `rudra@LAPTOP-E03:~/project$`
With Starship: `~/project on main via Python 3.12 >`

It can display:
* Current folder
* Git branch
* Python version
* Node.js version
* AWS profile
* Docker context
* Command execution time
* Previous command status

It works in Zsh, Bash, PowerShell, and Fish.

## 1. Install Starship

Run:

```bash
curl -sS https://starship.rs/install.sh | sh
```

When it asks `Install Starship?`, type `y` and press Enter.

## 2. Verify installation

Run:

```bash
starship --version
```

Example output: `starship 1.xx.x`

## 3. Connect Starship to Zsh

Open your `.zshrc`:

```bash
nano ~/.zshrc
```

Go to the bottom and add:

```bash
eval "$(starship init zsh)"
```

Save and exit (`Ctrl + O`, `Enter`, `Ctrl + X`).

## 4. Reload Zsh

Instead of closing the terminal, run:

```bash
source ~/.zshrc
```

Your prompt should immediately change.

## 5. Verify

Run:

```bash
pwd
```

If your prompt now looks different, Starship is working.

## 6. Configuration

By default, the configuration file is located at `~/.config/starship.toml`. It doesn't exist yet, so Starship uses its built-in theme until you create this file.

Create the folder if needed:

```bash
mkdir -p ~/.config
```

Create the config file:

```bash
nano ~/.config/starship.toml
```

For now, leave it empty or just save it.

## How Starship Works

1. Terminal Opens
2. Zsh starts
3. Reads `~/.zshrc`
4. Runs `eval "$(starship init zsh)"`
5. Starship loads
6. Reads `~/.config/starship.toml`
7. Shows prompt

## How to disable Starship

Edit `~/.zshrc`:

```bash
nano ~/.zshrc
```

Comment out the line:

```bash
# eval "$(starship init zsh)"
```

Then reload:

```bash
source ~/.zshrc
```

## How to uninstall Starship

Remove the initialization line from `.zshrc`.

Then remove the binary:

```bash
rm ~/.local/bin/starship
```

Or, if you installed it elsewhere, locate it first:

```bash
which starship
```

Delete the path it reports.

Finally, remove the configuration:

```bash
rm ~/.config/starship.toml
```
