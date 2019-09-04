#!/bin/bash
set -e

source secrets/heroku.env

echo "> Pushing image to heroku..."
docker login --username=${HEROKU_LOGIN} --password=${HEROKU_TOKEN} registry.heroku.com
docker tag sunzhongmou/nginx-apigw:latest registry.heroku.com/oneapi-stg/web:latest
docker push registry.heroku.com/oneapi-stg/web:latest
