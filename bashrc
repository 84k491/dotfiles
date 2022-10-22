# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
PATH=$PATH:/home/bakar/repos/alacritty/target/release
export PATH

alias gs="git status"
