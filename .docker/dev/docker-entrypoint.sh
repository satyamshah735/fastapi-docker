#!/usr/bin/env bash

set -euo pipefail

echo "Starting FastAPI..."

cd /app

# Create .venv directory with correct ownership
if [ ! -d "${VIRTUAL_ENV}" ]; then
    echo "Creating virtual environment..."

    mkdir -p "${VIRTUAL_ENV}"

    # Ensure current user owns it
    chown -R "$(id -u):$(id -g)" "${VIRTUAL_ENV}"

    python -m venv "${VIRTUAL_ENV}"
fi

# Install dependencies
poetry install --no-interaction

exec "$@"