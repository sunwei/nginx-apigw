#!/bin/bash
set -e

sed -i -e 's/HEROKU_DYNO_PORT/${PORT}/g' /nginx/api_gw.d/api.oneapi.cc.conf

cat /nginx/api_gw.d/api.oneapi.cc.conf

exec "$@"