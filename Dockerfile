# https://hub.docker.com/_/alpine
FROM alpine:3.16@sha256:4ff3ca91275773af45cb4b0834e12b7eb47d1c18f770a0b151381cd227f4c253

RUN set -euxo pipefail && \
    adduser -S -D -H --gecos "" -s /bin/sh ffuf && \
    apk add --no-cache tini ca-certificates && \
    wget https://github.com/ffuf/ffuf/releases/download/v1.5.0/ffuf_1.5.0_linux_amd64.tar.gz -O - | tar xvfz - -C /usr/bin ffuf

USER ffuf

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/ffuf"]
