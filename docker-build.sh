#!/bin/bash
set -e
BASEDIR=$(dirname "$0")

source common.sh

export VERSION="${1:-local}"
DOCKER_COMPOSE_SERVICE=apigw
DOCKER_IMAGE=eu.gcr.io/techops-infradel/platform-api-gateway

bold "Logging docker into gcloud..."
echo "$(gcloud auth print-access-token)" | \
docker login -u oauth2accesstoken --password-stdin https://eu.gcr.io

bold "## INFO: Trying to pull image to use its cache"
docker-compose pull --ignore-pull-failures $DOCKER_COMPOSE_SERVICE

bold "## INFO: Building image"
docker-compose build $DOCKER_COMPOSE_SERVICE

bold "## INFO: Pushing: $DOCKER_IMAGE:$VERSION"
gcloud docker -- push $DOCKER_IMAGE:$VERSION
