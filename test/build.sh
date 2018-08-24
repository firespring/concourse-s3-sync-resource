#!/bin/sh

set -e

json=$(cat ../config.json)
docker_user=$(echo "$json" | jq -r '.source.docker_user')
docker_repo=$(echo "$json" | jq -r '.source.docker_repo')

docker build -t "${docker_user}/${docker_repo}" .
