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
    wget \
    clang \
    xsel \
    openssh-server \
    npm \
    nodejs \
    openjdk-8-jdk-headless

if [ !-e $HOME/workspace/gitrepo/gitprompt ]; then
    mkdir -p $HOME/workspace/gitrepo/gitprompt
fi

wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O $HOME/workspace/gitrepo/gitprompt/git-completion.bash
wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O $HOME/workspace/gitrepo/gitprompt/git-prompt.sh

sudo npm cache clean
sudo npm install n -g
sudo n stable
sudo ln -sf /usr/local/bin/node /usr/bin/node
