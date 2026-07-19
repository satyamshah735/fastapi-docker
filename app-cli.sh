#!/usr/bin/env bash

set -Eeuo pipefail

readonly ENV_FILE=".env"
readonly COMPOSE_FILE="compose.yml"
readonly PROJECT_NAME="fastapi-template"
readonly APP_CONTAINER="api-server"

APPLICATION_UID=$(id -u)

docker compose \
    --env-file ${ENV_FILE} \
    --file ${COMPOSE_FILE} \
    --project-name ${PROJECT_NAME} \
    exec \
    --user ${APPLICATION_UID} \
    ${APP_CONTAINER} \
    bash