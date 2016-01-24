#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /home/bruno/.git-prompt.sh

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\n\$ '
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;32m\][\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]]\[\e[m\]\[\e[1;33m\]$(__git_ps1 " (%s)")\[\e[m\]\n\$ \[\e[1;37m\]'

export VISUAL="vim"


