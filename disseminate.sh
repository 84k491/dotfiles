#!/bin/bash

ask_and_copy() {
    do_continue=true
    while true; do
        read -p "Copy \"$1\" -> \"$2\"?. Do you want to override it? (y/n)" yn
        case $yn in
            [Yy]* ) do_continue=true; break;;
            [Nn]* ) do_continue=false; break;;
            * ) echo "Please answer 'y' or 'n'.";;
        esac
    done

    if [ $do_continue = true ];
    then
        #echo "Copying $1 -> $2"
        cp $1 $2 -v
    fi
}

ask_and_copy ./vimrc ~/.vimrc
ask_and_copy ./bashrc ~/.bashrc
ask_and_copy ./alacritty.yml ~/.config/alacritty/alacritty.yml
ask_and_copy ./tmux.conf ~/.tmux.conf

ask_and_copy ./nvim_config/init.vim ~/.config/nvim/init.vim
ask_and_copy ./nvim_config/config.lua ~/.config/nvim/lua/config.lua
ask_and_copy ./nvim_config/plugins.lua ~/.config/nvim/lua/plugins.lua

ask_and_copy config.fish ~/.config/fish/config.fish
ask_and_copy starship.toml ~/.config/starship.toml
