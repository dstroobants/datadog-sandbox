#!/bin/bash
while true; do
  log_content=$(cat log.conf)
  echo $log_content+='\n' >> script.log
  sleep 5
done
