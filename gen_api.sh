
#!/usr/bin/env bash

set -euo pipefail

if ! command -v docker &> /dev/null; then
  echo "Docker is not installed. Please install Docker to proceed."
  exit 1
fi

if ! command -v git &> /dev/null; then
  echo "Git is not installed. Please install Git to proceed."
  exit 1
fi

if ! git rev-parse --is-inside-work-tree &> /dev/null; then
  echo "This script must be run inside a Git repository. Exiting."
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working directory is not clean. Exiting."
  exit 1
fi

if [[ ! -d "gen/openapi" ]]; then
  mkdir -p gen/openapi
else
  rm -r gen/openapi/*
fi


# NOTE: We mount the entire lib directory to get all generated files
docker run --rm \
  -v ${PWD}/gen/openapi:/local/ \
  openapitools/openapi-generator-cli generate \
  -i http://host.docker.internal:8000/openapi.json \
  -g dart-dio \
  -o /local/

cd ./gen/openapi/

dart run build_runner build --delete-conflicting-outputs
