FROM alpine:latest
MAINTAINER liubo@huwei123.com

RUN apk --no-cache --no-progress add curl nodejs
RUN curl --location http://firekylin.org/release/latest.tar.gz | tar xzf - && mv firekylin /app 
WORKDIR /app/
RUN npm install &&  rm -rf /tmp/npm* /var/cache/apk/*

EXPOSE 8360
ENTRYPOINT ["/usr/bin/node"]
CMD ["/app/www/production.js"]
