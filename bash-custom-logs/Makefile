#!make
include ../.env
export

build-dev:
	docker build --no-cache \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t logging-bash-script .

build:
	docker build \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t logging-bash-script .

run: build
	docker run -d --rm -v ${PWD}/app/log.conf:/logging-script/log.conf --name dd-agent-logging-bash-script logging-bash-script
	docker exec dd-agent-logging-bash-script service datadog-agent start

stop:
	docker stop dd-agent-logging-bash-script
	docker rm dd-agent-logging-bash-script
