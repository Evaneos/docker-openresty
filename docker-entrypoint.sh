#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
	set -- openresty "$@"
fi

if [ "$1" = 'openresty' ]; then
	echo resolver $(awk 'BEGIN{ORS=" "} $1=="nameserver" {print $2}' /etc/resolv.conf) ";" > /usr/local/openresty/nginx/conf/resolvers.conf
	exec "$@"
fi

exec "$@"