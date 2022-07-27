#!make
include ../.env
export

$(shell chmod +x ../utils/local_port.sh)
$(shell chmod +x ../utils/svc_name.sh)
LOCAL_PORT=$(shell sh ../utils/local_port.sh)
SVC_NAME=$(shell sh ../utils/svc_name.sh)

test:
	echo ${SVC_NAME}

build-dev:
	docker build --no-cache \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t apm-flask-api .

build:
	docker build \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t apm-flask-api .

run: build
	docker run -d --rm -p ${LOCAL_PORT}:5000 \
		-v ${PWD}/app/app.py:/app.py \
		--name dd-agent-apm-flask-api apm-flask-api
	docker exec dd-agent-apm-flask-api service datadog-agent start

stop:
	docker stop dd-agent-apm-flask-api
	docker rm dd-agent-apm-flask-api
