#!/usr/bin/env bash

# link nvim config script
mkdir -p ~/.config/nvim
ln -s "${PWD}"/init.lua ~/.config/nvim/init.lua
ln -s "${PWD}"/lua      ~/.config/nvim/lua

# install packer.vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ripgrep is a line-oriented search tool that recursively searches the current
# directory for a regex pattern
# https://github.com/BurntSushi/ripgrep
brew install ripgrep

# fd is a program to find entries in your filesystem
# https://github.com/sharkdp/fd
brew install fd-find

# install nodejs
brew install node
