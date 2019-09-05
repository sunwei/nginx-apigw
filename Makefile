unlock:
	./unlock.sh

build:
	docker-compose build nginx-apigw

push:
	./docker-push.sh

push-to-heroku:
	./docker-push-to-heroku.sh

deploy:
	./heroku-deploy.sh

run:
	docker run --name oneapi -itd -p 8000:80 oneapi-nginx-gateway

exec:
	docker exec -it oneapi  bash

clean:
	docker stop oneapi && docker rm oneapi