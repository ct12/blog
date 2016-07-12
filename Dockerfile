FROM alpine:latest
MAINTAINER liubo@huwei123.com

RUN apk --no-cache --no-progress add bash nodejs
RUN mkdir /app /data
ADD . /app
RUN chmod +x /app/start.sh
WORKDIR /data
ADD http://firekylin.org/release/firekylin_0.12.5.tar.gz
WORKDIR /data/firekylin
RUN npm install

VOLUME ["/data"]
EXPOSE 8360
ENTRYPOINT ["/app/start.sh"]