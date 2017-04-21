FROM alpine:3.2

RUN apk --update add python py-pip && \
    pip install elasticsearch-curator==3.4.0

COPY ./bin /usr/local/bin

ENTRYPOINT ["/usr/local/bin/curator-cron"]
