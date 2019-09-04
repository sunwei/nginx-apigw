#!/bin/bash
set -e

source secrets/heroku.env

docker login --email=${HEROKU_LOGIN} --username=${HEROKU_LOGIN} --password=${HEROKU_TOKEN} registry.heroku.com
docker tag sunzhongmou/nginx-apigw:latest registry.heroku.com/oneapi-stg/web:latest
docker push registry.heroku.com/oneapi-stg/web:latest
