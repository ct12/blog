FROM alpine:latest
MAINTAINER liubo@huwei123.com

RUN apk --no-cache --no-progress add  nodejs
RUN mkdir  /data

WORKDIR /data
RUN wget http://firekylin.org/release/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm -f latest.tar.gz
WORKDIR /data/firekylin
RUN npm install

EXPOSE 8360
ENTRYPOINT ["/usr/bin/node"]
CMD ["/data/firekylin/www/production.js"]