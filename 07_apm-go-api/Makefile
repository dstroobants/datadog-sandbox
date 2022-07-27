#!make
include ../.env
export

$(shell chmod +x ../utils/local_port.sh)
LOCAL_PORT=$(shell sh ../utils/local_port.sh)

build-dev:
	docker build --no-cache \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t apm-go-api .

build:
	docker build \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t apm-go-api .

run: build
	docker run -d --rm -p ${LOCAL_PORT}:5000 \
		--name dd-agent-apm-go-api apm-go-api
	docker exec dd-agent-apm-go-api service datadog-agent start

stop:
	docker stop dd-agent-apm-go-api
	docker rm dd-agent-apm-go-api
