#!/bin/bash

dirName=${PWD##*/}
projectNumber=${dirName:0:2}
localhostPort=$((5000 + $projectNumber))
echo $localhostPort
