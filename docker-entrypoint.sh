#!/bin/bash
set -e

sed -i -e 's/listen 80;/listen HEROKU_DYNO_PORT;/g' /etc/nginx/api_gw.d/*.conf
sed -i -e 's/HEROKU_DYNO_PORT/'"${PORT}"'/g' /etc/nginx/api_gw.d/*.conf
sed -i -e 's/HEROKU_DYNO_PORT/'"${PORT}"'/g' /etc/nginx/conf.d/default.conf

exec "$@"