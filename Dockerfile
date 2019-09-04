FROM nginx:latest

WORKDIR /app
COPY . /app/

COPY nginx/ /etc/nginx/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
