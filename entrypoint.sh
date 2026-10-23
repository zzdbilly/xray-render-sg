#!/bin/sh
set -eu
: "${UUID:?set UUID}"
: "${WS_PATH:=/ws}"
: "${PORT:=8080}"
sed -i "s|__PORT__|${PORT}|g; s|__WS_PATH__|${WS_PATH}|g; s|__UUID__|${UUID}|g" /usr/local/etc/xray/config.json
exec /usr/local/bin/xray run -config /usr/local/etc/xray/config.json
