if [ ! -e ~/workspace  ]; then
    mkdir -p ~/workspace/gitrepo
    mkdir -p ~/workspace/dev
fi

which brew
if [ ! $? -eq 1 ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    ln -fs /home/linuxbrew/.linuxbrew $HOME/.linuxbrew
fi

sudo apt install -y \
    build-essential \
    xsel \
    dconf-cli \
    tilix \

# elementary theme
wget -O xt  http://git.io/v3D8e && chmod +x xt && ./xt && rm xt

brew install \
    boost \
    cmake \
    ctags \
    curl \
    git \
    global --wigh-pygments \
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
    npm \
    wget

pip3 install -U pip
pip3 install neovim
pip3 install neovim-remote
npm install -g neovim

if [ ! -e $HOME/workspace/gitrepo/gitprompt ]; then
    mkdir -p $HOME/workspace/gitrepo/gitprompt
fi

wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O $HOME/workspace/gitrepo/gitprompt/git-completion.bash
wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O $HOME/workspace/gitrepo/gitprompt/git-prompt.sh

