#!make
include ../.env
export

build-dev:
	docker build --no-cache \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t logging-script .

build:
	docker build \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t logging-script .

run: build
	docker run -d --rm --name dd-agent-logging-script logging-script

stop:
	docker stop dd-agent-logging-script
