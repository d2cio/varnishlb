#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -j unix,user=vcache -F \
  -f /etc/varnish/default.vcl \
  -s malloc,$CACHE_SIZE \
  -a 0.0.0.0:$PORT"
