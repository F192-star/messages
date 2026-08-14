FROM alpine:latest

ARG PB_VERSION=0.30.5

RUN apk add --no-cache \
    unzip \
    ca-certificates \
    wget

RUN wget -q \
    https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    -O /tmp/pocketbase.zip

RUN unzip /tmp/pocketbase.zip -d /pb

WORKDIR /pb

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
