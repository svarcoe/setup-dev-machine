FROM ubuntu

RUN mkdir setup-dev-machine
WORKDIR setup-dev-machine

COPY init.sh .
RUN chmod +x ./init.sh
RUN ./init.sh

COPY setup.sh .
RUN chmod +x ./setup.sh
RUN ./setup.sh

COPY .gitconfig /root
COPY .zshrc /root

CMD ["/usr/bin/zsh"]

