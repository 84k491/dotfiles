if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

fish_add_path "$HOME/bin"
fish_add_path "/home/user/.cargo/bin"
set -xg EDITOR "nvim"

alias gs='git status'
alias gb='git branch'
alias bell='echo -e \\a'

source ~/.config/fish/local_conf.fish
starship init fish | source
