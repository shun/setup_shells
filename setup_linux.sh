if [ ! -e ~/workspace  ]; then
    mkdir -p ~/workspace/gitrepo
    mkdir -p ~/workspace/dev
fi

which brew
echo $?
if [ ! $? -eq 1 ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    ln -fs /home/linuxbrew/.linuxbrew $HOME/.linuxbrew
fi

sudo apt install build-essential xsel dconf-cli
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

# install docker-ce
sudo aptremove docker docker-engine docker.io
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update -y
sudo apt install docker-ce

#install paper icon theme
sudo add-apt-repository ppa:snwh/pulp
sudo apt update
sudo apt install -y paper-icon-theme
sudo apt install -y paper-icon-theme paper-cursor-theme paper-gtk-theme

#install arc-thme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update

