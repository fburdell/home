function alg() { 
	for run in 1 2 
	do 
		xdg-open "/home/frank/info/_plan/algebra_beginandinterm.pdf"
	done
}

function findf() { 
	find $1 -wholename -name  $2
}

function findd() { 
	find $1 -type d -name $2	
}


#enables path removal
function rm-path {
  # Delete path by parts so we can never accidentally remove sub paths
  PATH=${PATH//":$1:"/":"} # delete any instances in the middle
  PATH=${PATH/#"$1:"/} # delete any instance at the beginning
  PATH=${PATH/%":$1"/} # delete any instance in the at the end
}

#assumes file with URL as text only
#opens those URLs in google chrome
function gopen() { 
	for f in $1; 
	do 
		cat $f | xargs google-chrome $2;
	done
}


#func multiple file type opening
#usage fopen
function opens() { 
	for f in $1;
	do
		xdg-open $f
	done

}

function lx() { 
	for f in *.tex; 
	do 
		pdflatex $f
	done

	exit
}

# func tab titling
function title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# temp envs
export PATH=/home/frank/go/bin/:/usr/bin/texlive/2020/bin/x86_64-linux:$PATH
export PYTHONPATH="$PYTHONPATH:/home/frank/python/" 
export PIPENV_PYUP_API_KEY="" #removes warning for local pkg imorts
export PROMPT_DIRTRIM=1 # trim terminal prompt

# app commands
alias pip='pip3'
alias py='python3'
alias vi='vim'
alias vibashrc='vim ~/.bashrc'
alias sbc='source ~/.bashrc'
alias vivi='vim ~/.vimrc'
alias open='xdg-open'
alias apt='apt-get'
alias vicron='sudo crontab -e'
alias cronlog='grep CRON /var/log/syslog'
alias pathsty='sudo cp *.sty /usr/share/texmf/tex/latex/'
alias pg_main='psql -U frank main'
alias goog='google-chrome'

# movement commands
alias '..'="open ."
alias 'kl'='exit'
alias 'lk'='fc -s'

# dir mgmt
alias home='cd ~'
alias down='cd ~/Downloads'
alias checkdown='ls ~/Downloads'
alias cleardown='rm -rvf ~/Downloads/*'
alias gopix='open ~/Pictures'

# navigation
alias cda='cd ..'
alias cdb='cd ../..'
alias cdc='cd ../../..'
alias cdd='cd ../../../..'

# file commands
alias findd='find -type d -name'
alias findf='find -name'

# removeals
alias rmd='rm -rvf'
alias rma='rm *'

# listing
alias ld='ls -d -- */'
alias lf="ls | grep -v '^d'"
alias la='ls -a'

# clearing
alias cl='clear'
alias cls='clear && ls'
alias cla='clear && la'

# get documents
alias mdc_memo='cp -r ~/mdc/templates/memo/'
alias mdc_letter='cp -r ~/mdc/templates/letter/'





#####################################################
#####################################################
#####################################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#bind 'TAB':menu-complete

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[090m\]/\h/\u/\[\033[094m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" # to place user@host in to tab title
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi


