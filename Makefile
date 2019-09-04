unlock:
	./unlock.sh

build:
	docker-compose build nginx-apigw

push:
	./docker-push.sh

run:
	docker run --name oneapi -itd -p 8000:80 oneapi-nginx-gateway

exec:
	docker exec -it oneapi  bash

clean:
	docker stop oneapi && docker rm oneapi