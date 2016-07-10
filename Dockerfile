FROM alpine:3.1

RUN apk add --update asterisk
ADD ./etc /etc

ADD ./entrypoint.sh /
ADD ./entrypoint_debug.sh /

# And when the container is started, run asterisk
ENTRYPOINT [ "/entrypoint.sh" ]
