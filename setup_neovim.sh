
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y \
    neovim
    python-dev \
    python-pip \
    python3-dev \
    python3-pip

pip install -U pip
pip3 install -U pip
pip install neovim
pip3 install neovim

# 
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/.cache/nvim/dein

# install golang

if [ x"$GOROOT" == "x" ]; then
    s1=<<\
"EOS"
export GOPATH=$HOME/.go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
EOS
    echo $s1 >> ~/.bashrc
fi

GOVER=1.8

if [ x"$GOVER" == "x" ]; then
    echo "Please put the golang version."
    exit 1
fi

wget https://storage.googleapis.com/golang/go$GOVER.linux-amd64.tar.gz -O /tmp/go.gz
sudo mv /tmp/go /usr/local

go get -u github.com/constabulary/gb/...
go get -u github.com/nsf/gocode

