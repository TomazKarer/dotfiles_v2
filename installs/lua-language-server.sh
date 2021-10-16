#!/bin/bash
sudo apt install tmux ninja-build build-essential
current_dir = $(pwd)
mkdir ~/development/lsps -p
git clone https://github.com/sumneko/lua-language-server ~/development/lsps/lua-language-server
cd ~/development/lsps/lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

cd $current_dir
