FROM golang:1.14-alpine3.12

RUN apk add --no-cache openssl ca-certificates pkgconfig g++ git

# Install librdkafka v1.4.2

ARG LIBRDKAFKA_VERSION=1.4.2

RUN apk --update add --virtual build-dependencies gcc bash build-base zstd-dev && \
    git clone https://github.com/edenhill/librdkafka.git && \
    cd librdkafka && \
    git checkout v${LIBRDKAFKA_VERSION} && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    apk del build-dependencies && \
    rm -rf librdkafka

# add required zstd for compression
RUN apk add zstd-libs

ENV CGO_ENABLED=1 \
    GOOS=linux \
    GOARCH=amd64 

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]