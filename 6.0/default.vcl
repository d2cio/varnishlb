vcl 4.0;

backend default {
  .host = "127.0.0.1";
  .port = "8080";
}

acl cloudflare {
  # set this ip to your Railgun IP (if applicable)
  # "1.2.3.4";
}

acl purge {
  "localhost";
  "127.0.0.1";
}

include "lib/xforward.vcl";
include "lib/cloudflare.vcl";
include "lib/purge.vcl";
include "lib/bigfiles.vcl";
include "lib/static.vcl";

# Pick just one of the following:
# (or don't use either of these if your application is "adaptive")
# include "lib/mobile_cache.vcl";
# include "lib/mobile_pass.vcl";

#include "lib/wordpress.vcl";
