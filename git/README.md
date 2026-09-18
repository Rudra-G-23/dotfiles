# Git

## Setup & SSH connection to GitHub

Check if Git is installed:

```bash
git --version
```

If not:

```bash
sudo apt install git
```

Configure identity:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
git config --list
```

Generate an SSH key (accept the defaults):

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

Start the agent and add the key:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Copy the public key and add it to GitHub (Settings → SSH and GPG keys → New SSH key):

```bash
cat ~/.ssh/id_ed25519.pub
```

Test the connection:

```bash
ssh -T git@github.com
```

## Dotfiles this repo tracks

```
dotfiles/
├── .bashrc
├── .zshrc
├── .gitconfig
├── .gitattributes
├── .gitignore
└── README.md
```
