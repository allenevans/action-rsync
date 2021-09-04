FROM alpine:3.14

RUN apk update && apk add \
    openssh-client \
    rsync

COPY src/entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
