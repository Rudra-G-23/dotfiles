# Python (WSL / Ubuntu)

See also: https://github.com/FinalAngel/dotfiles/tree/master/python

## 1. System Python

```bash
sudo apt update && sudo apt upgrade -y
python3 --version
```

## 2. Specific version via pyenv

We install `pyenv` and pin a specific Python version (currently 3.13.7) instead of relying on the system one.

Install build dependencies:

```bash
sudo apt update
sudo apt install -y build-essential curl git make zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libssl-dev libffi-dev liblzma-dev tk-dev xz-utils llvm libncursesw5-dev libxml2-dev libxmlsec1-dev wget ca-certificates
```

Install pyenv:

```bash
curl https://pyenv.run | bash
```

Add to `~/.bashrc` (or `~/.zshrc`):

```bash
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
```

Reload the shell, then:

```bash
pyenv --version
pyenv install --list | grep 3.13
pyenv install 3.13.7
pyenv global 3.13.7
```

Verify:

```bash
python --version      # Python 3.13.7
which python           # ~/.pyenv/shims/python
pyenv versions          # * marks the active version
```
