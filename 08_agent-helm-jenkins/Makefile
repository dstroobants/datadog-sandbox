#!make
include ../.env
export

install:
	kubectl config use-context docker-desktop && \
	kubectl create namespace jenkins --dry-run=client -o yaml | kubectl apply -f - && \
	helm install helm-jenkins -n jenkins -f values.yaml jenkins/jenkins && \
	kubectl -n jenkins port-forward svc/helm-jenkins 8080:8080

upgrade:
	kubectl config use-context docker-desktop && \
	helm upgrade helm-jenkins -n jenkins -f values.yaml jenkins/jenkins

delete:
	kubectl config use-context docker-desktop && \
	helm delete helm-jenkins

