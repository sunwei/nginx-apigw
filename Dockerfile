FROM nginx:latest

WORKDIR /app
COPY . /app/

COPY nginx/ /etc/nginx/

sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/api_gw.d/*.conf

CMD ["nginx", "-g", "daemon off;"]
