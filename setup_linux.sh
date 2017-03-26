if [ ! -e ~/workspace  ]; then
    mkdir -p ~/workspace/gitrepo
    mkdir -p ~/workspace/dev
fi

sudo apt-get install -y \
    terminator \
    python3 \
    vim-gnome \
    ranger \
    git \
    tig \
    ruby \
    fish \
    curl \
    wget\ 
    clang
