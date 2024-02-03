#!/bin/sh
set -e

# See Ollama documentation for pull model(s): https://github.com/ollama/ollama/blob/v0.1.23/docs/api.md
for i in $(echo $OLLAMA_MODELS | sed "s/,/ /g")
do
    curl http://ollama:11434/api/pull -d "{\"name\": \"$i\"}"
done
