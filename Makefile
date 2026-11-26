.PHONY: build run docker-build clean

build:
	npm install

run:
	REDIS_HOST=localhost CATALOGUE_URL=http://localhost:8002 node server.js

docker-build:
	env
	docker build -t kaldevops14.azurecr.io/roboshop-cart:${GITHUB_SHA} .

docker-push:
	docker push kaldevops14.azurecr.io/roboshop-cart:${GITHUB_SHA}

clean:
	rm -rf node_modules
