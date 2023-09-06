FROM alpine:latest

LABEL maintainer="Philipp Herzog <philipp@herzo.gs>"

WORKDIR /root

RUN apk update && \
    apk add tor
RUN rm -f /etc/tor/torrc*
COPY ./torrc /etc/tor/torrc
COPY ./init.sh /root/init.sh

RUN mkdir -p /var/lib/tor && \
    chown -R root:root /var/lib/tor

ENTRYPOINT /root/init.sh
