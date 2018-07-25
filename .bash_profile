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
