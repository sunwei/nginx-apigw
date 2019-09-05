FROM nginx:latest

WORKDIR /app
COPY . /app/

COPY nginx/ /etc/nginx/

RUN sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/api_gw.d/api.oneapi.cc.conf

CMD ["nginx", "-g", "daemon off;"]
