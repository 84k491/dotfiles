#!/bin/bash

rm ~/.vimrc
ln -s $(readlink -f ./vimrc) ~/.vimrc
rm ~/.bashrc
ln -s $(readlink -f ./bashrc) ~/.bashrc
rm ~/.config/alacritty/alacritty.yml
ln -s $(readlink -f ./alacritty.yml) ~/.config/alacritty/alacritty.yml
