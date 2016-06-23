FROM debian:jessie

RUN apt-get update -y && \
    apt-get install -y asterisk

# And when the container is started, run asterisk
  ENTRYPOINT [ "/usr/sbin/asterisk", "-f" ]
