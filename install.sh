#!/bin/bash

CURRENT_DIR=$(pwd)

echo "Linking .tmux.conf"
ln -s -f $CURRENT_DIR/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

echo "Linking .inputrc"
ln -s -f $CURRENT_DIR/.inputrc ~/.inputrc

echo "Linking .vimrc"
ln -s -f $CURRENT_DIR/.vimrc ~/.vimrc

mkdir ~/.config/nvim/lua -p

echo "Linking init.vim"
ln -s -f $(pwd)/neovim/init.vim ~/.config/nvim/init.vim
echo "Linking settings.lua"
ln -s -f $(pwd)/neovim/lua/settings.lua ~/.config/nvim/lua/settings.lua
echo "Linking init.lua"
ln -s -f $(pwd)/neovim/lua/init.lua ~/.config/nvim/lua/init.lua
echo "Linking plugins.lua"
ln -s -f $(pwd)/neovim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua

