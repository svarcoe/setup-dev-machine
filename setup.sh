mkdir setup-dev-machine
cd setup-dev-machine

apt-get update -q
apt-get install -q -y 	\
	curl		\
	sudo 		\
	lsb-release	\
	wget		\
	apt-utils	\
	unzip		\
	apt-transport-https


export CLOUD_SDK_REPO='cloud-sdk-$(lsb_release -c -s)'
echo 'deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main' | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -


curl -sL https://deb.nodesource.com/setup_8.x | bash -

apt-get install -q -y 		\
	build-essential		\
	checkinstall		\
	nodejs			\
	zsh			\
	git			\
	python			\
	python-pip		\
	docker.io		\
	unzip			

apt-get install google-cloud-sdk -q -y
apt-get clean -q -y


wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa-linux-x86_64-0.8.0.zip
mv exa-linux-x86_64 /usr/local/bin/exa
export ls='exa -bhl --git'

wget https://github.com/koki/short/releases/download/v0.4.0/short_linux_amd64 -q
mv short_linux_amd64 /usr/local/bin/short

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -q
apt list --installed
/usr/bin/zsh ./install.sh
