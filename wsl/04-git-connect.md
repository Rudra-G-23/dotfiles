# Git Configuration and Connection

Part 1: Create your first project

```bash
mkdir -p ~/projects/learning_python
cd ~/projects/learning_python
code .
```

Inside VS Code, create a `main.py` file.

Part 2: Connect to GitHub

First check if Git is installed:
```bash
git --version
```

If Git isn't installed:
```bash
sudo apt install git
```

Configure Git (replace with your details):
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
```

Verify your configuration:
```bash
git config --list
```

Generate an SSH key:
```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```
Press Enter for every prompt to accept the defaults.

Start the SSH agent:
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Copy your public key:
```bash
cat ~/.ssh/id_ed25519.pub
```
Copy the entire output (it starts with `ssh-ed25519`).

Add it to GitHub:
1. Go to your GitHub account.
2. Click your profile picture → Settings.
3. Navigate to SSH and GPG keys.
4. Click New SSH key.
5. Paste the copied key.
6. Save it.

Test the connection:
```bash
ssh -T git@github.com
```
The first time you'll be asked to trust GitHub's host key. Type `yes`. If everything is correct, you'll see a welcome message confirming authentication.