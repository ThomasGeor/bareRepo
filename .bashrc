# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Define aliases in ~/.bash_aliases instead of here
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set readline editor mode
set -o vi

# History control
HISTCONTROL=ignoreboth # protect passwords and API keys
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE='ll:ls:clear:pwd:exit:fg:bg:top:df:history'

shopt -s histappend
shopt -s histverify
shopt -s histreedit

# Disable XON/XOFF flow control to enable forward history search
stty -ixon

# Filename expansions
FIGNORE='.swp:.o:~'

shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s direxpand
shopt -s dotglob
shopt -s failglob
shopt -s globstar
shopt -s nocaseglob

shopt -s xpg_echo
shopt -s checkjobs

# Use lesspipe on top of less for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#Jetson nano on boot
#sudo jetson_clocks
#PATH=$PATH:/usr/local/cuda-11.0/bin

# TODO: Customize prompt and output colors.
cat << 'EOF'
EOF
PROMPT_DIR_TRIM=3
PROMPT_COMMAND=''
#populate - to match the terminal length
PS0="--------------------------------------------------------\n"
PS1=$PS0"\e[0;0;32m\s \V Dev:\l \n \w\nPrc:\j \n[\t/\d] \u@\h\$ \e[0m"
PS2="My test prompt2"
PS4="-"

# custom colors of common commands
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

# System settings
# TODO:check for.vim/pack/themes/start existance and download package if needed

# Don't show untracked files when checking the bare repo's status
gitBareRepo config status.showUntrackedFiles no
