#!/bin/bash

setup_brew() {
  type brew > /dev/null 2>&1
  if [ $? -eq 1 ]; then
    echo "install brew..."
    # install brew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update

  brew install \
    anyenv \
    cmake \
    coreutils \
    curl \
    fzf \
    ghq \
    git \
    global \
    gnu-sed \
    go \
    highlight \
    p7zip \
    ripgrep \
    tig \
    wget

  brew upgrade
}

setup_shell() {
  if [ ! "$SHELL" = "/usr/local/bin/bash" ]; then
    chsh -s /usr/local/bin/bash
  fi
}

#setup_neovim() {
#}

setup_envs() {
  anyenv install nodenv

  ANYENV_ROOT=$(anyenv root)
  mkdir -p ${ANYENV_ROOT}/plugins
  if [ ! -e ${ANYENV_ROOT}/plugins/anyenv-update ]; then
    git clone https://github.com/znz/anyenv-update.git ${ANYENV_ROOT}/plugins/anyenv-update
  fi

  NODENV_ROOT=$(nodenv root)
  mkdir -p ${NODENV_ROOT}/plugins
  if [ ! -e "${NODENV_ROOT}/plugins/nodenv-default-packages" ]; then
    git clone https://github.com/nodenv/nodenv-default-packages.git "${NODENV_ROOT}/plugins/nodenv-default-packages"
  fi

  touch $(nodenv root)/default-packages
}
#setup_brew
#setup_shell
#setup_gotools
setup_envs
