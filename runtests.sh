#!/bin/bash
docker rm slim-tests
./composer dumpautoload
docker run -v $(pwd):/var/www/html --env-file vars --name slim-tests -i cis-5750-container /bin/bash -c "cd test && ./../vendor/bin/phpunit ."
docker rm slim-tests
