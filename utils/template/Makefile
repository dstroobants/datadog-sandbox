#!make
# Export ENV variables
include ../.env
export

# Utilities to automate svc names and exposed ports
$(shell chmod +x ../utils/local_port.sh)
$(shell chmod +x ../utils/svc_name.sh)
LOCAL_PORT=$(shell sh ../utils/local_port.sh)
SVC_NAME=$(shell sh ../utils/svc_name.sh)

build-dev:
	docker build --no-cache \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t ${SVC_NAME} .

build:
	docker build \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t ${SVC_NAME} .

run: build
	docker run -d --rm -p ${LOCAL_PORT}:5000 \
		-v ${PWD}/app/app.py:/app.py \
		--name dd-agent-${SVC_NAME} ${SVC_NAME}
	docker exec dd-agent-${SVC_NAME} service datadog-agent start

stop:
	docker stop dd-agent-${SVC_NAME}
	docker rm dd-agent-${SVC_NAME}
