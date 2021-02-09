#!/bin/bash
set -eu

CLANG_VER=11
GO_VER=1.15.7
NODE_VER=15

setup_as_root() {
    sudo bash -c "apt update \
        && apt upgrade -y \
        && apt install -y \
            bash-completion \
            build-essential \
            cmake \
            curl \
            clang-${CLANG_VER} \
            clang-format-${CLANG_VER} \
            clangd-${CLANG_VER} \
            docker-compose \
            fcitx \
            fcitx-mozc \
            gcc \
            global \
            htop \
            jq \
            make \
            python3 \
            python3-pip \
            ripgrep \
            tig \
            tilix \
            tmux \
            vim \
            xsel \
        && add-apt-repository ppa:git-core/ppa -y \
        && curl -sL https://deb.nodesource.com/setup_${NODE_VER}.x | bash - \
        && apt update \
        && apt install -y \
            git \
            nodejs \
        && npm install --global yarn \
        && curl -L https://golang.org/dl/go${GO_VER}.linux-amd64.tar.gz | tar -zxf - -C /usr/local \
        && curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz | tar -zxf - --strip=1 -C /usr/local/ \
        && pip3 install -U pynvim
    "
}

setup_as_user() {
    /usr/local/go/bin/go get github.com/x-motemen/ghq \
        && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
        && ~/.fzf/install --all \
        && ~/go/bin/ghq get git@github.com:shun/dotconfig.git \
        && mkdir -p ~/workspace/dev \
        && yarn global add \
            eslint \
            eslint-config-prettier \
            prettier \
            ts-node \
            typescript \
            typesync
}

setup_x2go() {
    sudo bash -c "apt update \
        && apt install -y software-properties-common \
        && add-apt-repository ppa:x2go/stable \
        && apt update \
        && apt install -y \
            x2goserver \
            x2goserver-xsession
    "
}

setup_as_root
setup_as_user
setup_x2go
