#!/bin/sh
aws s3 cp s3://$S3_CONFIG_BUCKET/$S3_CONFIG_KEY /etc/nginx/conf.d/default.conf
exec nginx -g 'daemon off;'
