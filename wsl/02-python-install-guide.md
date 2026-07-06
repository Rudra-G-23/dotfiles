## Install Python

Step 1. Update Ubuntu

Run:
```bash
sudo apt update && sudo apt upgrade -y
```

Check the system Python version:
```bash
python3 --version
```
(This is the Python version that comes with Ubuntu inside your WSL environment.)

## Specific Python version download

We will install:
- pyenv
- Python 3.13.7 (latest stable in the 3.13 series)
- Set 3.13.7 as the default Python

Step 1: Install build dependencies

```bash
sudo apt update
sudo apt install -y build-essential curl git make zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libssl-dev libffi-dev liblzma-dev tk-dev xz-utils llvm libncursesw5-dev libxml2-dev libxmlsec1-dev wget ca-certificates
```

Wait until it finishes.

Step 2: Install pyenv

```bash
curl https://pyenv.run | bash
```

Step 3: Configure your shell

Open your shell configuration:
```bash
nano ~/.bashrc
```

Go to the very bottom of the file and paste:
```bash
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
```

Save and exit: `Ctrl + O`, `Enter`, `Ctrl + X`

Step 4: Reload your shell
```bash
source ~/.bashrc
```

Step 5: Verify pyenv
```bash
pyenv --version
```

Step 6: See available Python versions
```bash
pyenv install --list | grep 3.13
```

Step 7: Install Python 3.13.7
```bash
pyenv install 3.13.7
```
(This step may take 5–15 minutes because Python is compiled from source).

Step 8: Make it your global Python
```bash
pyenv global 3.13.7
```

Step 9: Verify
```bash
python --version
python3 --version
```
Both should report: `Python 3.13.7`

Step 10: Check where Python comes from
```bash
which python
```
Expected output: `~/.pyenv/shims/python`

Verify the active version:
```bash
pyenv versions
```
The `*` indicates that 3.13.7 is your active version.