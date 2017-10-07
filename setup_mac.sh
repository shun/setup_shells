#!/usr/local/bin/bash

if [ ! -e ~/workspace  ]; then
    mkdir -p ~/workspace/gitrepo
    mkdir -p ~/workspace/dev
    mkdir -p ~/workspace/gitprompt
fi


wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O $HOME/workspace/gitrepo/gitprompt/git-completion.bash
wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O $HOME/workspace/gitrepo/gitprompt/git-prompt.sh

cd $HOME/workspace/gitrepo
if [ ! -e myscript ]; then
    git clone git@github.com:shun/myscript.git
fi

if [ ! -e dotconfig ]; then
    git clone git@github.com:shun/dotconfig.git

    cd dotconfig
    bash setup.sh
fi


# check brew install status
command_='/usr/local/bin/brew'
type $command_  > /dev/null 2>&1

if [ ! $? = 0 ]; then
    # install brew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi

brew install \
    boost \
    cmake \
    curl \
    git \
    go \
    highlight \
    llvm \
    neovim \
    p7zip \
    peco \
    pt \
    python3 \
    ranger \
    tig \
    wget

brew cask install java

pip3 install -U pip
pip3 install neovim
pip3 install neovim-remote

# install nodejs, typescript
which node
if [ ! $? -eq 0 ]; then
    brew install npm
    sudo npm install -g typescript
fi

# install rust lang
which ructc
if [ ! $? -eq 0 ]; then
    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
    cargo install rustfmt
    cargo install racer
fi

