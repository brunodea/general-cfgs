#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source /home/bruno/.git-prompt.sh

gitbranch=$(__git_ps1 "(%s)")
if [[ -z $gitbranch ]]
then
    gitbranch=""
else
    gitbranch="\[\e[1;33m\]${gitbranch}\[\e[m\]"
fi
user='\[\e[0;32m\]\u\[\e[m\]'
lbracket='\[\e[1;32m\][\[\e[m\]'
rbracket='\[\e[1;32m\]]\[\e[m\]'
dir='\[\e[1;34m\]\w\[\e[m\]'
end='$\[\e[1;37m\]\[\e[m\] '
PS1="${user} ${lbracket}${dir}${rbracket}\n${end}"

alias ls='ls --color=auto'

export VISUAL="gvim"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

source ~/.git-completion.bash
PATH=$PATH:$HOME/.cargo/bin
