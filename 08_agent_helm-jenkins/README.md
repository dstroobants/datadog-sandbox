# Helm Datadog Agent
Kubernetes Datadog agent configured to be deployed on docker-desktop kubernetes

## Requirements

[Kubernetes on Docker](https://docs.docker.com/desktop/kubernetes/)

[Helm](https://helm.sh/docs/intro/install/)

## Usage

Make sure you have created the `.env` file mentionned in the [root Readme](../README.md)

`make install` will deploy the datadog-agent chart into your local docker-desktop kubernetes 
cluster

`make upgrade` will upgrade the helm release

`make delete` to remove the chart installation
