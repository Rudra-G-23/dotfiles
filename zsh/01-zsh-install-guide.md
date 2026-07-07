# Zsh Install Guide

## 1. Install Zsh

```bash
sudo apt install zsh -y
```

## 2. Verify installation

Run:

```bash
zsh --version
```

Expected: `zsh 5.x`

## 3. Where is Zsh installed?

Run:

```bash
which zsh
```

Expected: `/usr/bin/zsh`

This is the executable we'll make your default shell.

## 4. Test Zsh (without making it default)

Start a temporary Zsh session:

```bash
zsh
```

Your prompt will change slightly. Check the current shell:

```bash
echo $SHELL
```

It may still show `/bin/bash`. This is normal. `$SHELL` shows your login shell, not the shell you're currently running.

To confirm you're actually inside Zsh, run:

```bash
echo $0
```

Expected: `zsh`

## 5. Exit the temporary Zsh session

Type:

```bash
exit
```

You'll return to Bash. Check again:

```bash
echo $0
```

Expected: `bash`

## 6. Change the default shell

Once you've confirmed Zsh works, make it your default:

```bash
chsh -s $(which zsh)
```

If it asks for your password, use your Ubuntu password, not your Windows password. If successful, you may see no output at all. That's normal.

After reopening Ubuntu, Zsh will start automatically. When you first open Zsh, you might be prompted with a setup menu. After selecting `0` to create an empty config, check your home directory:

```bash
ls -la ~
cat ~/.zshrc
```

It should contain only a comment.

## 7. Verify Default Shell

Close all Ubuntu terminals. Then open WezTerm again and start Ubuntu:

```bash
wsl
```

Now run:

```bash
echo $SHELL
```

Expected: `/usr/bin/zsh` or `/bin/zsh`

Also run:

```bash
echo $0
```

Expected: `zsh`

---

## How to switch back to Bash later

If you ever want Bash back as the default:

```bash
chsh -s /bin/bash
```

Then restart your terminal.

## How to uninstall Zsh completely

```bash
sudo apt remove zsh
```

Or remove it along with its package configuration:

```bash
sudo apt purge zsh
sudo apt autoremove
```

**Important**: Before uninstalling Zsh, switch your default shell back to Bash using `chsh -s /bin/bash`, otherwise your login shell could point to a program that no longer exists.