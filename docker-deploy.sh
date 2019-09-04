#!/bin/bash
set -e

source secrets/heroku.env

echo "> Pushing image to heroku..."
echo "${HEROKU_TOKEN}" | \
docker login --username="${HEROKU_LOGIN}" --password-stdin registry.heroku.com
docker tag sunzhongmou/nginx-apigw:latest registry.heroku.com/oneapi-stg/web:latest
docker push registry.heroku.com/oneapi-stg/web:latest
