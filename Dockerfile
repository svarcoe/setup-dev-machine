FROM ubuntu

ARG ROOTFS_PATH

RUN mkdir setup-dev-machine
WORKDIR setup-dev-machine

COPY setup.sh .
RUN ./setup.sh

COPY $ROOTFS_PATH/.config /root/.config

ENTRYPOINT /bin/bash -c zsh

