set -e

echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -


curl -sL https://deb.nodesource.com/setup_8.x | bash -

DEBIAN_FRONTEND=noninteractive apt-get install -q -y 		\
	build-essential		\
	checkinstall		\
	nodejs			\
	zsh			\
	git			\
	python			\
	python-pip		\
	docker.io		\
	unzip			\
	google-cloud-sdk

apt-get clean -q -y


wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa-linux-x86_64-0.8.0.zip
mv exa-linux-x86_64 /usr/local/bin/exa
chmod +x /usr/local/bin/exa
export ls='exa -bhl --git'

wget https://github.com/koki/short/releases/download/v0.4.0/short_linux_amd64 -q
mv short_linux_amd64 /usr/local/bin/short
chmod +x /usr/local/bin/short

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -q
chmod +x ./install.sh
sh -c ./install.sh
