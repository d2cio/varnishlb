FROM haproxy:latest

RUN apt-get update && apt-get install -y supervisor curl ca-certificates --no-install-recommends

RUN curl -s -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /usr/local/bin/dumb-init

RUN curl -s https://packagecloud.io/install/repositories/varnishcache/varnish60/script.deb.sh | bash

RUN apt-get install -y varnish --no-install-recommends

ENV CACHE_SIZE=256m
ENV VARNISH_PORT=80

ADD default.vcl /etc/varnish/
ADD ./lib /etc/varnish/lib
ADD haproxy.cfg /usr/local/etc/haproxy/
ADD supervisord.conf /etc/supervisor/conf.d/

ENTRYPOINT []
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
