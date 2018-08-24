#!/bin/bash
set -e

json=$(cat config.json)
docker_user=$(echo "$json" | jq -r '.source.docker_user')
docker_repo=$(echo "$json" | jq -r '.source.docker_repo')

cd $(dirname $0)

DOCKER_TAG="${DOCKER_TAG:-latest}"

# login to docker, prompt for authentication
docker login

# Build the concourse image redis container
docker build -f Dockerfile -t ${docker_user}/${docker_repo}:${DOCKER_TAG} .
docker push ${docker_user}/${docker_repo}:${DOCKER_TAG}

echo
echo
echo "Newest version has been pushed to Dockerhub."
echo
