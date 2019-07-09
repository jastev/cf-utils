FROM alpine:edge
LABEL MAINTAINER="Jason Stevens <jason.stevens@microsoft.com>"

RUN apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        jq ;\
    update-ca-certificates ;\
    wget -O - https://github.com/concourse/concourse/releases/download/v5.3.0/fly-5.3.0-linux-amd64.tgz | tar -C /usr/local/bin -xzf -
