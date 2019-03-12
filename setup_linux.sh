#!/bin/bash
set -e

# add google chrome repository
which google-chrome-stable > /dev/null #2&>1
if [ $? -ne 0 ]; then
	curl https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
	echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
fi

# paper-icon-theme
add-apt-repository -y -u ppa:snwh/ppa

apt update && apt upgrade -y && \
apt install -y \
	arc-theme \
	build-essential \
	ctags \
	curl \
	fcitx-mozc \
	fonts-noto-* \
	git \
	global \
	google-chrome-stable \
	gparted \
	golang \
	htop \
	i3 \
	openssh-server \
	paper-icon-theme \
	python3 \
	python3-pip \
	tig \
	tmux \
	vim \
	wget \
	xsel \

if [ ! -e ~/.local/bin ]; then
	mkdir ~/.local/bin
fi

# install pt
go get -u github.com/monochromegane/the_platinum_searcher/...

# install peco
PECO_VER=v0.5.3
curl -L https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz | tar -zxv -C ~/.local/bin/ && mv ~/.local/bin/peco_linux_amd64/peco ~/.local/bin/ && rm -rf ~/.local/bin/peco_linux_amd64/

# setup docker
curl -L https://raw.githubusercontent.com/shun/ubuntu-docker-setup/master/install_docker.sh | sudo bash
python3 -m pip install docker-compose
CTOP_VER=0.7.2
wget https://github.com/bcicen/ctop/releases/download/v$CTOP_VER/ctop-$CTOP_VER-linux-amd64 -O ~/.local/bin/ctop
gpasswd -a kudo docker

chmod -R a+x ~/.local/bin/
chown -R kudo:kudo ~/.local/bin/

