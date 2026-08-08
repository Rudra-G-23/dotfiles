# System Compatibility Check

> llmfit Setup Guide for WSL

[llmfit](https://github.com/AlexsJones/llmfit) is a tool to test hardware compatibility and run LLMs.

## 1. Install
```bash
curl -fsSL https://llmfit.axjns.dev/install.sh | sh
```
*(Or use `uv tool install -U llmfit`)*

## 2. Check Hardware & Models
- **TUI (Recommended):** `llmfit` (Shows hardware & fitment list)
- **CLI Hardware Check:** `llmfit doctor`
- **CLI Model List:** `llmfit fit`

## 3. Benchmarking
If running Ollama locally:
```bash
llmfit bench
```

## Uninstall
Remove binary:
```bash
sudo rm -f /usr/local/bin/llmfit
# or rm -f ~/.local/bin/llmfit
```
Remove config:
```bash
rm -rf ~/.config/llmfit ~/.cache/llmfit ~/.local/share/llmfit
```
