#!make
include ../.env
export

build-dev:
	docker build --no-cache \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t logging-python-script .

build:
	docker build \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t logging-python-script .

run: build
	docker run -d --rm --name dd-agent-logging-python-script logging-python-script
	docker exec dd-agent-logging-python-script service datadog-agent start

stop:
	docker stop dd-agent-logging-python-script
