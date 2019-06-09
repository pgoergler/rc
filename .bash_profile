# ~/.bashrc: executed by bash(1) for non-login shells.
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

color(){
    for c; do
        printf '\e[48;5;%dm%03d ' $c $c
    done
    printf '\e[0m \n'
}

tput_color() {
        IFS=$' \t\n'
        color {0..15}
        for ((i=0;i<6;i++)); do
            color $(seq $((i*36+16)) $((i*36+51)))
        done
        color {232..255}
}

gb() {
        git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n'
}
git_branch() {
        #gb | sed 's/[]//'
        br=$(gb)
        if [[ ! -z $br ]]; then
                if [[ $br == 'master' ]]; then
                        printf "[\e[0;32m$br\e[0m] "
                else
                        printf "[\e[0;91m⎇ \e[0m\e[38;5;214m$br\e[0m] "
                fi
        fi
}

git_prompt() {
        PS1='\n\[\e[0m\e[46m\][\t]\[\e[0m\] \[\e[36m\]\u\[\e[0m\]\[\e[32m\]@\[\e[0m\]\[\e[m\]\H\[\e[0m\] [\[\e[32m\]\w\[\e[0m\]] $(git_branch)\n\[\e[36m\]$\[\e[0m\] '
}

function rot13()
{
    # alias rot13='tr "a-zA-Z" "n-za-mN-ZA-M"'
    echo =`echo $1 | tr "a-zA-Z" "n-za-mN-ZA-M"`
}

umask 022

if [ "$PS1" ]; then

    export PAGER='less -SX'

    export HISTCONTROL=ignoredups
    export HISTIGNORE="su:ls:ll:la"

    export REAL_NAME="Paul GOERGLER"
    export EMAIL_ADDRESS="paul@egallys.com"
    export SVN_EDITOR="nano"
	   
    export PATH="/usr/local/opt/php55:/usr/local/bin:/usr/local/sbin:/usr/local/bin/git/bin:$PATH"
    export HISTSIZE=10000000
    export HISTFILESIZE=10000000

    # You may uncomment the following lines if you want `ls' to be colorized:
    export LS_OPTIONS='-G -h'
    if [[ -x 'dircolors' ]]; then
        eval `dircolors`
    fi
    alias ls='ls $LS_OPTIONS'
    alias ll='ls $LS_OPTIONS -l'
    alias la='ls $LS_OPTIONS -a'
    alias lla='ls $LS_OPTIONS -al'    
    alias l='ls $LS_OPTIONS -lA'
    #
    # Some more alias to avoid making mistakes:
    #    alias rm='rm -i'
    #    alias cp='cp -i'
    #    alias mv='mv -i'

    alias gcc='gcc -Wall'
    alias g++='g++ -Wall'


    alias allports='sudo netstat -alpe --ip'
    alias myports='sudo netstat -alpe --ip | grep paul'


    PS1='\n\[\e[0m\e[46m\][\t]\[\e[0m\] \[\e[1;32m\]>>>\[\e[0m\] \[\e[36m\]\u\[\e[0m\]\[\e[32m\]@\[\e[0m\]\[\e[m\]\H\[\e[0m\] \[\e[1;32m\]<<<\[\e[0m\] [\[\e[33m\]\w\[\e[0m\]] \n\[\e[36m\]$\[\e[0m\] '
    git_prompt
    # TMOUT=120


    case $TERM in
    xterm*)
        ;;
    linux*)
	export LANG="fr_FR"
	;;
    *)
        export LANG="fr_FR.utf8"
	;;
    esac


    export EDITOR=nano
fi

source ~/.bash_aliases


# KAFKA
export KAFKA_HOME=/usr/local/kafka
export KAFKA=/usr/local/kafka/bin
export KAFKA_CONFIG=/usr/local/kafka/config


#GOLANG
export GOPATH=$HOME/Dropbox/Development/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
