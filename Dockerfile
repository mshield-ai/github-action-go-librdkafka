FROM golang:1.14-alpine3.12

# hadolint ignore=DL3018
RUN apk add --no-cache openssl ca-certificates pkgconfig g++ git

# Install librdkafka v1.4.2

ARG LIBRDKAFKA_VERSION=1.4.2

# hadolint ignore=DL3018,DL3003
RUN apk add --no-cache  --virtual build-dependencies gcc bash build-base zstd-dev && \
    git clone https://github.com/edenhill/librdkafka.git && \
    cd librdkafka && \
    git checkout v${LIBRDKAFKA_VERSION} && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    rm -rf librdkafka

ENV CGO_ENABLED=1 \
    GOOS=linux \
    GOARCH=amd64

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]