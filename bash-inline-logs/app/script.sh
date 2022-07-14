#!/bin/bash
while true; do
  while IFS='' read -r line || [[ -n "$line" ]]; do
    echo $line+='\n' >> script.log
  done < log.txt
  sleep 5
done
