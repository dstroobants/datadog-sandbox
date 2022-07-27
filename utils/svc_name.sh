#!/bin/bash

# Calculate service name based on directory name
dir_name=${PWD##*/}
svc_name=$(echo $dir_name | sed -r 's/([^_]*_){1}//')
echo $svc_name
