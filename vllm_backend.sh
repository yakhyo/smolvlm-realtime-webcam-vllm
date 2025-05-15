#!/bin/bash

DEFAULT_MODEL="HuggingFaceTB/SmolVLM-500M-Instruct"

# Use first argument as model name if provided, else fallback to default
MODEL_NAME="${1:-$DEFAULT_MODEL}"

echo "Launching vLLM server with model: $MODEL_NAME"

python -m vllm.entrypoints.openai.api_server \
  --model "$MODEL_NAME" \
  --trust-remote-code \
  --tensor-parallel-size 1 \
  --gpu-memory-utilization 0.6 \
  --host 0.0.0.0 \
  --port 8000
