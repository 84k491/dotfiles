#!/bin/bash

ask_remove_and_copy() {
    do_continue=true
    if [ -e $2 ];
    then
        while true; do
            read -p "File \"$2\" already exist. Do you want to override it? (y/n)" yn
            case $yn in
                [Yy]* ) do_continue=true; break;;
                [Nn]* ) do_continue=false; break;;
                * ) echo "Please answer 'y' or 'n'.";;
            esac
        done

        if [ $do_continue = true ];
        then
            echo "Removing $2"
            rm $2
        fi
    fi

    if [ $do_continue = true ];
    then
        echo "Making a symlink $1 <- $2"
        ln -s $(readlink -f $1) $2
    fi
}

ask_remove_and_copy ./vimrc ~/.vimrc
ask_remove_and_copy ./bashrc ~/.bashrc
ask_remove_and_copy ./alacritty.yml ~/.config/alacritty/alacritty.yml
