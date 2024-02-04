# Visual Studio Code (VSCode) Ollama Local Code Co-pilot

An example to run an instance of [Ollama](https://ollama.ai/) via docker-compose and connect to VSCode for code completion / generation.

## Prerequisites

The project uses the following software:
* [Docker for desktop](https://www.docker.com/products/docker-desktop/)
* [CodeGPT Chat](https://marketplace.visualstudio.com/items?itemName=DanielSanMedium.dscodegpt)

## Usage

1. Navigate to the directory where the repository has been cloned and start the containers:

   ```commandline
   docker-compose up -d --build
   ```

2. Wait for the `ollama-setup-1` service to complete downloading [codellama](https://ollama.ai/library/codellama) and other models.

   ```commandline
    2024-01-31 23:36:50 {"status":"verifying sha256 digest"}
    2024-01-31 23:36:50 {"status":"writing manifest"}
    2024-01-31 23:36:50 {"status":"removing any unused layers"}
    2024-01-31 23:36:50 {"status":"success"}
    100 1128k    0 1128k    0    21   2546      0 --:--:--  0:07:33 --:--:--    23
   ```

3. Install CodeGPT onto VSCode and follow the instructions provided [here](https://docs.codegpt.co/docs/tutorial-ai-providers/ollama).

> [!NOTE]
> Initial prompts to Ollama might be slow, if the container was not previously running and not interacted with the model recently.

## Notes

### Using different Large Language Models (LLM) with CodeGPT

You can edit the `docker-entrypoint.sh` to pull any model available in the [Ollama library](https://ollama.ai/library), however CodeGPT currently
supports a [few models](https://docs.codegpt.co/docs/tutorial-ai-providers/ollama) via the UI. You will need to manually type in the model name you
have pulled into the 'Model' field for Ollama provider.

### What devices has this been tested on?

I have only tried the container on my MacBook Pro M1 Pro with 16 RAM, so YMMV.
