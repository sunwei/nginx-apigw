#!/bin/bash
set -e

sed -i -e 's/HEROKU_DYNO_PORT/${PORT}/g' /etc/nginx/api_gw.d/api.oneapi.cc.conf

cat /etc/nginx/api_gw.d/api.oneapi.cc.conf

exec "$@"