mkdir setup-dev-machine
cd setup-dev-machine

apt-get update -q
apt-get install -q -y 	\
	curl		\
	sudo		\
	lsb-release	\
	wget		\
	apt-utils	\
	unzip		\
	apt-transport-https
