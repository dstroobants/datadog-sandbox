# Flask API to generate traces
Flask API to generate traces

## Requirements

[Docker](https://www.docker.com/)

## Usage

Make sure you have created the `.env` file mentionned in the [root Readme](../README.md)

`make run` to start the docker container

Access this url `http://localhost:5000/Parameters?param1=myfirstparam&param2=86329893` 
to generate traces

`make stop` to stop the docker container
