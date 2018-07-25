#!/bin/bash

#https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
#https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.git-completion.bash

gitbranch=$(__git_ps1 "(%s)")
gitbranch="\[\e[1;33m\]${gitbranch}\[\e[m\]"

user='\[\e[0;32m\]\u\[\e[m\]'
lbracket='\[\e[1;32m\][\[\e[m\]'
rbracket='\[\e[1;32m\]]\[\e[m\]'
dir='\[\e[1;34m\]\w\[\e[m\]'
end='$\[\e[1;37m\]\[\e[m\] '
PS1="${user} ${lbracket}${dir}${rbracket} "'\[\e[1;33m\]$(__git_ps1 "(%s)")\[\e[m\]'"\n${end}"

alias ls='ls --color=auto'
alias ll='ls -l -a --color=auto'

alias upbash='vim ~/.bashrc'
alias refri='source ~/.bashrc'

export CARGO_HOME="~/.rust/cargo"
export RUSTUP_HOME="~/.rust/rustup"
export PATH="$PATH:$CARGO_HOME/bin"
# for racer
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# default text editor
export VISUAL="gvim"
