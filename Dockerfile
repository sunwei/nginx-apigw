FROM nginx:latest

WORKDIR /app
COPY . /app/

COPY nginx/ /etc/nginx/

CMD ["nginx", "-g", "daemon off;"]
