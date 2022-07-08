#!make
include ../.env
export

install:
	kubectl config use-context docker-desktop && \
	kubectl create namespace datadog --dry-run=client -o yaml | kubectl apply -f - && \
	helm install dd-helm-agent -n datadog -f values.yaml \
		--set datadog.site=${DD_SITE} --set datadog.apiKey=${DD_API_KEY} datadog/datadog

upgrade:
	helm upgrade dd-helm-agent -n datadog -f values.yaml \
		--set datadog.site=${DD_SITE} --set datadog.apiKey=${DD_API_KEY} datadog/datadog

delete:
	helm delete dd-helm-agent

