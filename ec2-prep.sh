#!/bin/bash
# the eb cli doesn't want to let me deploy for some reason, so let's manually bundle it. 
rm ec2.zip > /dev/null
mv Dockerfile Dockerfile.tmp
python3 add-secrets.py 
zip -r ec2.zip web/ api/ routes/ vendor/ lib/ .htaccess Dockerfile \
api/.htaccess web/.htaccess routes/.htaccess lib/.htaccess
rm Dockerfile
mv Dockerfile.tmp Dockerfile