#
# ~/.bash_profile
#
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

export RUST_SRC_PATH="/usr/src/rust/src/"
export PATH=$PATH:/home/bruno/.cargo/bin
