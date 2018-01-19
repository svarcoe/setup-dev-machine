FROM ubuntu

RUN mkdir setup-dev-machine
WORKDIR setup-dev-machine

COPY setup.sh .
RUN ./setup.sh

CMD ["/usr/bin/zsh"]

