#!/bin/bash
set -e

source secrets/heroku.env

echo "> Deploy web image..."

APP_ID_OR_NAME="oneapi-stg"
WEB_DOCKER_IMAGE_ID="$(docker inspect registry.heroku.com/oneapi-stg/web:latest --format={{.Id}})"

curl -n -X PATCH https://api.heroku.com/apps/${APP_ID_OR_NAME}/formation \
  -d '{
  "updates": [
    {
      "type": "web",
      "docker_image": "'"${WEB_DOCKER_IMAGE_ID}"'"
    }
  ]
}' \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer "${HEROKU_TOKEN}"" \
  -H "Accept: application/vnd.heroku+json; version=3.docker-releases"
