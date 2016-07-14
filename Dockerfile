FROM alpine:latest
MAINTAINER liubo@huwei123.com

RUN apk --no-cache --no-progress add curl nodejs
RUN curl --location http://firekylin.org/release/latest.tar.gz | tar xzf - && mv firekylin /app 
WORKDIR /app/firekylin
RUN npm install

EXPOSE 8360
ENTRYPOINT ["/usr/bin/node"]
CMD ["/app/firekylin/www/production.js"]