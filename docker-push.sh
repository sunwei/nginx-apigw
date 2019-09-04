#!/bin/bash
set -e

get_commit_count() {
  git rev-list --all --count
}

echo secrets/docker-hub.env
source secrets/docker-hub.env
echo "> Logging docker hub with user: ${DOCKER_USERNAME}"

echo "${DOCKER_PASSWORD}" | \
docker login --username="${DOCKER_USERNAME}" --password-stdin

echo "> Pushing image to docker hub..."
docker tag nginx-apigw:latest sunzhongmou/nginx-apigw:latest
docker push sunzhongmou/nginx-apigw:latest

docker tag sunzhongmou/nginx-apigw:latest "sunzhongmou/nginx-apigw:$(get_commit_count)"
docker push "sunzhongmou/nginx-apigw:$(get_commit_count)"