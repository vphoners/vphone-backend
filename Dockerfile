FROM ubuntu:xenial

RUN apt-get update -y && \
    apt-get install -y asterisk nano

ADD ./etc /etc

ADD ./entrypoint.sh /
ADD ./entrypoint_debug.sh /

# And when the container is started, run asterisk
ENTRYPOINT [ "/entrypoint.sh" ]