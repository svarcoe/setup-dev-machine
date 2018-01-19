FROM ubuntu

RUN mkdir setup-dev-machine
WORKDIR setup-dev-machine

COPY setup.sh .
RUN chmod +x ./setup.sh
RUN ./setup.sh

CMD ["/usr/bin/zsh"]

