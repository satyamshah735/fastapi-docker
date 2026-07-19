#!/usr/bin/env bash

set -Eeuo pipefail

readonly ENV_FILE=".env"
readonly COMPOSE_FILE="compose.yml"
readonly NETWORK_NAME="fastapi-network"
readonly PROJECT_NAME="fastapi-template"

if [[ ! -f "$ENV_FILE" ]]; then
    echo ".env file not found."
    echo
    echo "Create one first:"
    echo
    echo "cp .env.example .env"
    exit 1
fi

APPLICATION_UID=$(id -u)
APPLICATION_GID=$(id -g)

export APPLICATION_UID
export APPLICATION_GID

COMPOSE="docker compose \
    --env-file ${ENV_FILE} \
    --file ${COMPOSE_FILE} \
    --project-name ${PROJECT_NAME}"

case "${1:-start}" in

start)

docker network create ${NETWORK_NAME} >/dev/null 2>&1 || true

echo "Preparing .venv..."

if [[ ! -d ".venv" ]]; then

    mkdir .venv

fi

echo "Building..."

${COMPOSE} build \
    --build-arg APPLICATION_UID=${APPLICATION_UID} \
    --build-arg APPLICATION_GID=${APPLICATION_GID}

echo

echo "Starting..."

${COMPOSE} up

;;

stop)

echo "Stopping..."

${COMPOSE} down --remove-orphans

;;

restart)

echo "Restarting..."

${COMPOSE} down --remove-orphans

exec bash "$0" start

;;

logs)

${COMPOSE} logs -f

;;

build)

${COMPOSE} build

;;

*)

echo

echo "Usage"

echo

echo "bash start-docker.sh"

echo "bash start-docker.sh stop"

echo "bash start-docker.sh restart"

echo "bash start-docker.sh logs"

echo "bash start-docker.sh build"

exit 1

;;

esac