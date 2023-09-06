FROM alpine:latest

LABEL maintainer="Philipp Herzog <philipp@herzo.gs>"

WORKDIR /root

ARG ONION_ADDRESS
ARG USER_NAME

RUN apk add --update openssh-client tor torsocks bind-tools

COPY init.sh /root/init.sh

ENTRYPOINT [ "/root/init.sh" ]
