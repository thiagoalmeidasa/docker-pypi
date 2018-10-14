FROM alpine:3.7
LABEL MAINTAINER Thiago Almeida <thiagoalmeidasa@gmail.com>

RUN apk add --no-cache curl py-pip && \
    pip install --no-cache-dir --upgrade pip && \
    mkdir -p /srv/pypi

RUN pip install --no-cache-dir -U passlib pypiserver[cache]==1.2.3

EXPOSE 80
VOLUME ["/srv/pypi"]

ADD entrypoint.sh /
CMD ["/entrypoint.sh"]
