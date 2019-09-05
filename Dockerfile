FROM nginx:latest

WORKDIR /app
COPY . /app/

COPY nginx/ /etc/nginx/

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/api_gw.d/api.oneapi.cc.conf && nginx -g 'daemon off;'
