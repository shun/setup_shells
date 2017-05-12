# check brew install status
command_='/usr/local/bin/brew'
type $command_  > /dev/null 2>&1

if [ ! $? = 0 ]; then
    # install brew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi




brew install boost
brew install cmake

file_='~/.config/fish/functions/fisher.fish'
type $fish_  > /dev/null 2>&1

if [ ! $? = 0 ]; then
    # install fisher
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
fi

brew install fish
brew install go
brew install llvm
brew tap neovim/homebrew-neovim
brew install neovim
brew install p7zip
brew install peco
brew install python3
brew install pt
brew install wget
pip3 install neovim

# install rust lang
curl https://sh.rustup.rs -sSf | sh

# install nodejs, typescript
brew install npm
sudo npm install -g typescript

# install rust lang
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
cargo install rustfmt
cargo install racer

