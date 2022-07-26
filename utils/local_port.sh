#!/bin/bash

# Calculate localhost post based on service number
dir_name=${PWD##*/}
svc_number=${dir_name:0:2}
svc_number=$(( 10#$svc_number ))
local_port=$(( 5000 + $svc_number ))
echo $local_port
