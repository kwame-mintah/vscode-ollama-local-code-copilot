# Visual Studio Code (VSCode) Ollama Local Code Co-pilot

An example to run an instance of [Ollama](https://ollama.ai/) via docker-compose and connect to VSCode for code completion / generation.

## Prerequisites

The project uses the following software:
* [Docker for desktop](https://www.docker.com/products/docker-desktop/)
* [Llama Coder](https://marketplace.visualstudio.com/items?itemName=ex3ndr.llama-coder)

## Usage

1. Navigate to the directory where the repository has been cloned and start the containers:

   ```commandline
   docker-compose up -d --build
   ```

2. Wait for the `ollama-setup-1` service to complete downloading [codellama](https://ollama.ai/library/codellama)[^1] and other models.

   ```commandline
    2024-01-31 23:36:50 {"status":"verifying sha256 digest"}
    2024-01-31 23:36:50 {"status":"writing manifest"}
    2024-01-31 23:36:50 {"status":"removing any unused layers"}
    2024-01-31 23:36:50 {"status":"success"}
    100 1128k    0 1128k    0    21   2546      0 --:--:--  0:07:33 --:--:--    23
   ```

3. Install Llama Coder VSCode extension

![Example of extension running for code completion](/docs/llama_coder_stable_code_running_output_example.gif)

> [!NOTE]
> Initial prompts to Ollama might be slow, if the model and/or container was not previously running and not interacted with recently.
> Please note that the [`.env.sample`](.env.example) has the model loaded in memory set to [1 hour](https://github.com/ollama/ollama/blob/v0.5.11/docs/faq.md#how-do-i-keep-a-model-loaded-in-memory-or-make-it-unload-immediately).

## Notes

### Using different Large Language Models (LLM) with Llama Coder

You can edit the `docker-entrypoint.sh` to pull any model available in the [Ollama library](https://ollama.ai/library), however Llama Coder currently
supports a [few models](https://github.com/ex3ndr/llama-coder?tab=readme-ov-file#models) via the UI. Within the extension settings select a 'custom'
inference model and then enter the model name within the "Inference > Custom: Model" field.

### What devices has this been tested on?

I have only tried the container on my MacBook Pro M1 Pro with 16 RAM (2021), so YMMV. Also unable to comment on model(s) that require a
Graphics processing unit (GPU).

[^1]: Not all models perform the same on the host machine, please ensure you select an appropriate model for the best performance.
