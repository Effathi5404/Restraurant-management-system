#!/bin/bash
./composer dumpautoload
docker rm slim-tests
EXPOSED_PORT_CSC=8080
echo -e "\nWeb server running at: http://localhost:$EXPOSED_PORT_CSC/\n"
docker run -v $(pwd):/var/www/html --env-file vars --name slim-tests -i -p $EXPOSED_PORT_CSC:80 cis-5750-container