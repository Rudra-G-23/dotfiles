# Continue Configuration

**Extension ID:** `Continue.continue`
**Config Path:** `C:\Users\Rudra\.continue\config.yaml`

```yaml
name: Main Config
version: 1.0.0
schema: v1

models:
  # Main coding/chat model
  - name: Qwen 2.5 Coder 3B
    provider: ollama
    model: qwen2.5-coder:3b-instruct
    roles: [chat, edit, apply]

  # Fast inline autocomplete
  - name: Qwen 2.5 Coder 0.5B
    provider: ollama
    model: qwen2.5-coder:0.5b
    roles: [autocomplete]
    autocompleteOptions:
      maxPromptTokens: 1024
      debounceDelay: 250

  # Codebase embeddings
  - name: Nomic Embed
    provider: ollama
    model: nomic-embed-text
    roles: [embed]
```
