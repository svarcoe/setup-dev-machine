FROM ubuntu

ARG ROOTFS_PATH

RUN mkdir setup-dev-machine
WORKDIR setup-dev-machine

# install tools
RUN apt-get update -q &&	\
    apt-get install -q -y  	\
	curl			\
	sudo			\
	lsb-release		\
	wget			\
	apt-utils		

# setup apt for gcloud
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# setup for nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install -q -y 	\
	build-essential 	\
	checkinstall	 	\
	nodejs 			\
	zsh 			\
	git 			\
	google-cloud-sdk 	\
	python 			\
	python-pip		\
	docker.io		\
   && apt-get clean -q -y

# install oh my zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

COPY $ROOTFS_PATH/.config /root/.config

ENTRYPOINT /bin/bash -c zsh

