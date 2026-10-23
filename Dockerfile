FROM ghcr.io/xtls/xray-core:latest AS xray
FROM alpine:3.21
RUN apk add --no-cache ca-certificates tzdata
COPY --from=xray /usr/local/bin/xray /usr/local/bin/xray
COPY config.json /usr/local/etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh /usr/local/bin/xray
ENTRYPOINT ["/entrypoint.sh"]
