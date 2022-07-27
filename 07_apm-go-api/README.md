# Go API to generate traces
Go API to generate traces

## Requirements

[Docker](https://www.docker.com/)

## Usage

Make sure you have created the `.env` file mentionned in the [root Readme](../README.md)

`make run` to start the docker container

Access this url `http://localhost:5010/parameters?param1=myfirstparam&param2=123456` 
to generate traces

`make stop` to stop the docker container
