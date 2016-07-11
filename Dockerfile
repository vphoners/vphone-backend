FROM debian:experimental

RUN apt-get update && apt-get install -y asterisk
ADD ./etc /etc

ADD ./entrypoint.sh /
ADD ./entrypoint_debug.sh /

# And when the container is started, run asterisk
ENTRYPOINT [ "/entrypoint.sh" ]
