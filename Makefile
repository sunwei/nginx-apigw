APP_NAME = nginx-apigw

unlock:
	./unlock.sh

build:
	docker-compose build $(APP_NAME)

push:
	./docker-push.sh

push-to-heroku:
	./docker-push-to-heroku.sh

deploy:
	./heroku-deploy.sh

run:
	docker run --name $(APP_NAME) -itd -p 8000:8808 $(APP_NAME)

exec:
	docker exec -it $(APP_NAME) bash

clean:
	docker stop $(APP_NAME) && docker rm $(APP_NAME)