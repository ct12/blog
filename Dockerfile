FROM alpine:latest
MAINTAINER liubo@huwei123.com

RUN apk --no-cache --no-progress add  nodejs
RUN mkdir  /data

WORKDIR /data
RUN wget http://firekylin.org/release/firekylin_0.12.5.tar.gz
RUN tar xvf firekylin_0.12.5.tar.gz
WORKDIR /data/firekylin
RUN npm install

VOLUME ["/data"]
EXPOSE 8360
ENTRYPOINT ["/usr/bin/node"]
CMD ["/data/firekylin/www/production.js"]