#!/bin/sh

HOST_SERVER=${HOST_SERVER:-\$host}
PROXY_SSL_VERIFY=${PROXY_SSL_VERIFY:-on}
PROXY_CONNECT_TIMEOUT=${PROXY_CONNECT_TIMEOUT:-60}
PROXY_SEND_TIMEOUT=${PROXY_SEND_TIMEOUT:-60}
PROXY_READ_TIMEOUT=${PROXY_READ_TIMEOUT:-60}
PROXY_BUFFERS=${PROXY_BUFFERS:-4 32k}

/bin/sed -i "s@<proxy_pass_placeholder>@${TARGET_SERVER_ENDPOINT}@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<host_placeholder>@${HOST_SERVER}@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<proxy_ssl_verify>@${PROXY_SSL_VERIFY}@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<proxy_connect_timeout>@${PROXY_CONNECT_TIMEOUT}@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<proxy_send_timeout>@${PROXY_SEND_TIMEOUT}@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<proxy_read_timeout>@${PROXY_READ_TIMEOUT}@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<proxy_buffers>@${PROXY_BUFFERS}@" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"