#!/usr/bin/env ruby
require 'aws-sdk-s3'

s3_client = Aws::S3::Client.new
File.open('/etc/nginx/conf.d/default.conf', 'w') do |f|
  s3_client.get_object(bucket: ENV.fetch('S3_CONFIG_BUCKET'), key: ENV.fetch('S3_CONFIG_KEY'), response_target: f)
end

exec('nginx', '-g', 'daemon off;')
