#!/bin/bash

source utils.sh

BIN_DEPENDENCIES="nvim nimlsp clangd pylsp"
NPM_DEPENDENCIES="bash-language-server"

# Make sure everything is installed
for d in $BIN_DEPENDENCIES; do
	is_installed_bin $d
done

for d in $NPM_DEPENDENCIES; do
	is_installed_npm $d
done

# Install nvim packer manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Backup old config
cp -r ~/.config/nvim ~/.config/nvim.bak

# Copy config
cp -r init.lua lua ~/.config/nvim

# Start installing
nvim +PackerSync
