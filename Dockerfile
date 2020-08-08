FROM nginx:1.11.5

RUN apt-get update && \
    apt-get install -y ruby && \
    gem install --no-document aws-sdk-s3

COPY run-nginx.rb /usr/local/bin/run-nginx.rb
RUN chmod 755 /usr/local/bin/run-nginx.rb

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["/usr/local/bin/run-nginx.rb"]
