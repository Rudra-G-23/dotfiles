# Herdr

Multi-agent terminal tool.

## Install (inside WSL2)

Open your WSL2 environment (e.g. Ubuntu via Windows Terminal) and run:

```bash
curl -fsSL https://herdr.dev/install.sh | sh
```

Launch it with:

```bash
herdr
```

## Uninstall

1. Stop Herdr first:
   ```bash
   herdr server stop
   ```

2. Find where it's installed:
   ```bash
   which herdr
   ```
   Usually: `~/.local/bin/herdr`

3. Remove the binary:
   ```bash
   rm ~/.local/bin/herdr
   ```

4. Remove session/config data:
   ```bash
   ls -la ~/.config/herdr
   ls -la ~/.local/share/herdr
   ```
   To delete everything Herdr-related:
   ```bash
   rm -rf ~/.config/herdr ~/.local/share/herdr
   ```
