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
sudo apt install ripgrep

# fd is a program to find entries in your filesystem
# https://github.com/sharkdp/fd
sudo apt install fd-find

# install npm
sudo apt install npm

# update nodejs
sudo npm install -g n
sudo n lts # Long Term Support (or sudo n latest)

# install tree-sitter
sudo npm install -g tree-sitter-cli
