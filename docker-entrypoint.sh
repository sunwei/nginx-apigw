#!/bin/bash
set -e

sed -i -e 's/HEROKU_DYNO_PORT/${PORT}/g' /nginx/api_gw.d/api.oneapi.cc2.conf

cat /nginx/api_gw.d/api.oneapi.cc2.conf

exec "$@"