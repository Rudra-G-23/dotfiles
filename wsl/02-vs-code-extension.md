## VS Code Extension for WSL

1. Install the official WSL extension in your local VS Code: [WSL Extension](https://learn.microsoft.com/en-us/windows/wsl/)

2. Test your setup in WSL:
```bash
mkdir ~/test
cd ~/test
python3 -m venv .venv
code .
```
This will open the project in VS Code connected to WSL.