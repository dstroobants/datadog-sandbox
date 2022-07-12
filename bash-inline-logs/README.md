# Python script custom logs
Bash script to generate custom logs

## Requirements

[Docker](https://www.docker.com/)

## Usage

Make sure you have created the `.env` file mentionned in the [root Readme](../README.md)

Update `app/log.conf` with the log line you want to send to your datadog account

`make run` to start the docker container and start emitting logs

`make stop` to stop the docker container
