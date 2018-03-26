FROM haproxy:latest

RUN apt-get update && apt-get install -y curl

RUN curl -s https://packagecloud.io/install/repositories/varnishcache/varnish60/script.deb.sh | bash

RUN apt-get install -y varnish

ADD start.sh /
ADD default.vcl /etc/varnish/
ADD ./lib /etc/varnish/
ADD haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

ENV CACHE_SIZE=128m
ENV PORT=80

CMD "/start.sh"
