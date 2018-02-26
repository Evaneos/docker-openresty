FROM openresty/openresty:1.11.2.3-alpine

RUN apk add --no-cache bash

RUN mkdir /usr/local/openresty/nginx/conf/conf.d

RUN sed -i '$i\ \ \ \ include /usr/local/openresty/nginx/conf/conf.d/*.conf;' /usr/local/openresty/nginx/conf/nginx.conf

COPY ./docker-entrypoint.sh /entrypoint.sh

CMD ["openresty", "-g", "daemon off;"]

ENTRYPOINT ["/entrypoint.sh"]