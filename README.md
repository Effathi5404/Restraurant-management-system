# CSC5750-ROMS
CSC 5750: Web Development Project - Restaurant Order Management System

URL: http://roms-prod.us-east-1.elasticbeanstalk.com/

View current deployed commit hash: http://roms-prod.us-east-1.elasticbeanstalk.com/VERSION

Docs: http://roms-prod.us-east-1.elasticbeanstalk.com/docs/api

Route listing: http://roms-prod.us-east-1.elasticbeanstalk.com/api/

## Environment Setup
### Prequisites
- Docker
- Composer ```sudo apt install composer``` 
- Dependencies ```composer install```
- git  ```sudo apt install git```

### Build Image & Run
- Run:
    - ```./rebuild.sh```
- Expected output: 
```
$ ./rebuild.sh 
[sudo] password for cody: 
slim-tests
Sending build context to Docker daemon  878.6kB
Step 1/4 : FROM thecodingmachine/php:8.0-v4-apache-node14
 ---> b7d2ddcfd775
Step 2/4 : EXPOSE 80
 ---> Using cache
 ---> 54149f0ab2b6
Step 3/4 : ENV PORT 80
 ---> Using cache
 ---> a966fce5b197
Step 4/4 : COPY ./ /var/www/html/
 ---> ec581b9b6c72
Successfully built ec581b9b6c72
Successfully tagged cis-5750-container:latest

Web server running at: http://localhost:8080/api
```

For quick development, you can run ```./rundev.sh``` which only mounts your local directory and doesn't copy it into the container. 

### Verify Image is *ok*
- `php api-health-check.php`
    - Will exercise common endpoints and ensure they returned expected response codes. Helpful for debugging any permission issues or routing issues introduced. 
    - Expected output:
```
$ php api-health-check.php
✔: api/lib (404 === 404)
✔: lib (403 === 403)
✔: api/routes (404 === 404)
✔: routes (403 === 403)
✔: api/authentication/register (200 === 200)
✔: api/ (404 === 404)
✔: api/order/ (404 === 404)
✔: api/order/1 (200 === 200)
✔: api/order/1/item/1 (200 === 200)
✔: api/checkout/1 (200 === 200)

✔: All routes ok.
```
