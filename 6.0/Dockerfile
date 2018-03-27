FROM haproxy:latest

RUN apt-get update && apt-get install -y curl

RUN curl -s https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 -o /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN curl -s https://packagecloud.io/install/repositories/varnishcache/varnish60/script.deb.sh | bash

RUN apt-get install -y varnish

ADD varnish.sh /
ADD default.vcl /etc/varnish/
ADD ./lib /etc/varnish/lib
ADD haproxy.cfg /usr/local/etc/haproxy/

ENV CACHE_SIZE=128m
ENV PORT=80

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["haproxy", "-W", "-f", "/usr/local/etc/haproxy/haproxy.cfg", "&", "/varnish.sh"]
