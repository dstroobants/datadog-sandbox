#!make
# Export ENV variables
include ../.env
export

# Utilities to automate svc names and exposed ports
$(shell chmod +x ../utils/local_port.sh)
$(shell chmod +x ../utils/svc_name.sh)
LOCAL_PORT=$(shell sh ../utils/local_port.sh)
SVC_NAME=$(shell sh ../utils/svc_name.sh)

build:
	docker build \
		--build-arg DD_API_KEY=${DD_API_KEY} \
		--build-arg DD_SITE=${DD_SITE} \
		-t ${SVC_NAME} .

run-it:
	docker run --name dd-agent-${SVC_NAME} \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		-v /proc/:/host/proc/:ro \
		-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
		-e DD_API_KEY=${DD_API_KEY} -e DD_SITE=${DD_SITE} \
		-e DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true \
		${SVC_NAME}

run: build
	docker run -d --name dd-agent-${SVC_NAME} \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		-v /proc/:/host/proc/:ro \
		-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
		-e DD_API_KEY=${DD_API_KEY} -e DD_SITE=${DD_SITE} \
		-e DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true \
		${SVC_NAME}

stop:
	docker stop dd-agent-${SVC_NAME}
	docker rm dd-agent-${SVC_NAME}

exec:
	docker exec -it dd-agent-${SVC_NAME} bash

agent-logs:
	docker exec dd-agent-${SVC_NAME} cat /var/log/datadog/agent.log > agent.log
