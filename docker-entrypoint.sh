#!/bin/sh
set -e

# See Ollama documentation for pull model(s): https://github.com/ollama/ollama/blob/main/docs/api.md#pull-a-model
curl http://ollama:11434/api/pull -d '{"name": "codellama"}'
