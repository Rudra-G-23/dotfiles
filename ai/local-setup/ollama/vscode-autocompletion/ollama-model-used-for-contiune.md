# Recommended Models for WSL (8GB Available RAM, CPU only)

Given the constraints (AMD Ryzen 5 5500U, 6 cores, ~8GB usable RAM in WSL), running two smaller models is required to avoid crashing.

## 1. Models Used

| Role | Model | Why |
|---|---|---|
| **Autocomplete** | `qwen2.5-coder:0.5b` | ~1.3GB RAM. Fast for CPU (~34 tok/s). Avoids typing lag. |
| **Chat / Q&A** | `qwen2.5-coder:3b-instruct` | ~4.7GB RAM. Good quality. Only loads during active chat. |
| **Embeddings** | `nomic-embed-text` | For codebase context. |

*Avoid 7B models as they will consume all available RAM.*

## 2. Pull Models
```bash
ollama pull qwen2.5-coder:0.5b
ollama pull qwen2.5-coder:3b-instruct
ollama pull nomic-embed-text
```

## 3. Continue `config.json`
```json
{
  "tabAutocompleteModel": {
    "title": "Autocomplete",
    "provider": "ollama",
    "model": "qwen2.5-coder:0.5b"
  },
  "models": [
    {
      "title": "Coder Chat",
      "provider": "ollama",
      "model": "qwen2.5-coder:3b-instruct",
      "contextLength": 8192
    }
  ]
}
```
*Note: Context length is capped at 8192 to save RAM.*

## 4. Increase WSL Memory
Create or edit `C:\Users\<yourname>\.wslconfig`:
```ini
[wsl2]
memory=12GB
processors=6
```
Restart WSL: `wsl --shutdown`
