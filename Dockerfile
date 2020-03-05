# stage 1: build src code to binary
FROM golang:1.13-alpine3.10 as builder

COPY *.go /app/

RUN cd /app && go build -o helloworld .

# stage 2: use alpine as base image
FROM alpine:3.10

RUN apk update && \
    apk --no-cache add tzdata ca-certificates && \
    cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*
# 使用--from的参数做到拷贝使用
COPY --from=builder /app/helloworld /helloworld

CMD ["/helloworld"]
