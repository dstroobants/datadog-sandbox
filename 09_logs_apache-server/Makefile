#!make
include ../.env
export

$(shell chmod +x ../utils/local_port.sh)
LOCAL_PORT=$(shell sh ../utils/local_port.sh)

build-dev:
	docker build --no-cache \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t logs-apache-dd-agent .

build:
	docker build \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t logs-apache-dd-agent .

run: build
	docker run -d --rm -p ${LOCAL_PORT}:80 \
		--name logs-apache-dd-agent logs-apache-dd-agent
	docker exec logs-apache-dd-agent service datadog-agent start

stop:
	docker stop logs-apache-dd-agent
	docker rm logs-apache-dd-agent
