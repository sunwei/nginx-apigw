FROM sunzhongmou/nginx:latest

WORKDIR /app
COPY . /app/

COPY nginx/ /etc/nginx/

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]