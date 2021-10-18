#!/bin/bash

CURRENT_DIR=$(pwd)

sudo apt update
sudo apt install git tmux

mkdir ~/development/home -p

git clone git@github.com:TomazKarer/gurs_avto.git ~/development/home/gurs_avto
git clone git@github.com:TomazKarer/karer.si.git ~/development/home/karer.si
git clone git@github.com:TomazKarer/personal_wiki.git ~/development/home/personal_wiki
git clone git@github.com:TomazKarer/karers.eu.git ~/development/servers/karers.eu
git clone git@github.com:TomazKarer/mars_tf_hetzner.git ~/development/servers/mars_tf_hetzner
git clone git@github.com:TomazKarer/secrets.git ~/development/servers/secrets

echo "Linking .tmux.conf"
ln -s -f $CURRENT_DIR/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

echo "Linking .inputrc"
ln -s -f $CURRENT_DIR/.inputrc ~/.inputrc

#echo "Linking .vimrc"
#ln -s -f $CURRENT_DIR/.vimrc ~/.vimrc

mkdir ~/development/apps/nvim -p
#wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -O ~/development/apps/nvim/nvim
chmod u+x ~/development/apps/nvim/nvim
sudo ln -s ~/development/apps/nvim/nvim /usr/bin/nvim

mkdir ~/.config/nvim/ -p

echo "Linking neovim/"
ln -s -f $(pwd)/neovim/* ~/.config/nvim/
#echo "Linking init.vim"
#ln -s -f $(pwd)/neovim/init.vim ~/.config/nvim/init.vim
#echo "Linking settings.lua"
#ln -s -f $(pwd)/neovim/lua/settings.lua ~/.config/nvim/lua/settings.lua
#echo "Linking init.lua"
#ln -s -f $(pwd)/neovim/lua/init.lua ~/.config/nvim/lua/init.lua
#echo "Linking plugins.lua"
#ln -s -f $(pwd)/neovim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua

#. ./installs/terraform.sh
#. ./installs/lua-language-server.sh
. ./installs/minikube.sh
return 0
