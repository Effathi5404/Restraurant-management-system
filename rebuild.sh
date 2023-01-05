#!/bin/bash

EXPOSED_PORT_CSC=8080

./composer dumpautoload

docker rm slim-tests

docker build -t cis-5750-container . && \
echo -e "\nWeb server running at: http://localhost:$EXPOSED_PORT_CSC/api\n" && \
docker run --env-file vars --name slim-tests -i -p $EXPOSED_PORT_CSC:80 cis-5750-container

