#!/bin/bash

cp ~/.bashrc ./bashrc
cp ~/.config/alacritty/alacritty.toml ./alacritty.toml
cp ~/.tmux.conf ./tmux.conf

cp ~/.config/nvim/init.lua ./nvim_config/
cp ~/.config/nvim/lua/config.lua ./nvim_config/lua/
cp ~/.config/nvim/lua/lazy_setup.lua ./nvim_config/lua/

cp ~/.config/fish/config.fish config.fish
cp ~/.config/starship.toml starship.toml
