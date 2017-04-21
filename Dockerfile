FROM alpine:3.5

RUN apk --update add python py-pip && \
    pip install elasticsearch-curator==4.3.0

COPY ./bin /usr/local/bin

ENTRYPOINT ["/usr/local/bin/curator-cron"]
