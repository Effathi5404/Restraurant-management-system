#!/bin/bash
# the eb cli doesn't want to let me deploy for some reason, so let's manually bundle it. 
zip -r ec2.zip web/ api/ routes/ vendor/ lib/ .htaccess Dockerfile \
api/.htaccess web/.htaccess routes/.htaccess lib/.htaccess