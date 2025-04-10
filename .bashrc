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

VISUAL=vim
EDITOR=vim
# Dirs - blue | Text, Markdown - yellow | Awk, Shell scripts - green | C Source, Header files - magenta
export LS_COLORS='di=01;34:*.txt=00;33:*.md=00;33:*.sh=00;32:*.awk=00;32:*.c=00;35:*.h=00;35'

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

# Ignored filename expansions
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

#Jetson nano on boot
#sudo jetson_clocks
#PATH=$PATH:/usr/local/cuda-11.0/bin

# Prompt customization
cat << 'EOF'
                                                                 #####
                                                                #######
                   #                                            ##O#O##
  ######          ###                                           #VVVVV#
    ##             #                                          ##  VVV  ##
    ##         ###    ### ####   ###    ###  ##### #####     #          ##
    ##        #  ##    ###    ##  ##     ##    ##   ##      #            ##
    ##       #   ##    ##     ##  ##     ##      ###        #            ###
    ##          ###    ##     ##  ##     ##      ###       QQ#           ##Q
    ##       # ###     ##     ##  ##     ##     ## ##    QQQQQQ#       #QQQQQQ
    ##      ## ### #   ##     ##  ###   ###    ##   ##   QQQQQQQ#     #QQQQQQQ
  ############  ###   ####   ####   #### ### ##### #####   QQQQQ#######QQQQQ
EOF

OUTPUT_BORDER=
adjust_output_border(){
    OUTPUT_BORDER=""
    # adjust to window size by sourcing .bashrc
    for ((i=0; i<$COLUMNS; i++))
    do
        OUTPUT_BORDER+="-"
    done
}
adjust_output_border

#BASH_INFO="\[\e[0;0;32m\]\s \V Dev:\l \[\e[0m\]\n"
#DATE_INFO="\[\e[0;0;35m\]\[[\t/\d]\[\e[0m\n\]"
PROMPT_DIR_TRIM=3
SYSTEM_INFO="\[\e[0;0;36m\]\[ \w | Prc:\j \[\e[0m\]\n"
USER_INFO="\[\e[0;0;32m\]\u@\h\$ \[\e[0m\]"
RAM_TOTAL="$(awk '/MemTotal/ {printf "%d",$2;}' /proc/meminfo)"
IP_ADDRESS="$(ip addr | awk 'BEGIN{ORS=" | "} /inet/ && /eth/ {print "IP: "$2}')"

system_stats (){
    adjust_output_border
    echo -n $OUTPUT_BORDER
    if [ -f cpu_load.awk ];then
      CPU_LOAD="$(./cpu_load.awk)"
    fi
    RAM_USAGE="$(awk -v total=$RAM_TOTAL 'BEGIN{ORS=" | "} /MemAvailable/ {print "RAM: "(1-($2/total))*100"%"}' /proc/meminfo)"
    DISK_USAGE="$(df -T | awk 'BEGIN{ORS=" | "} /:\\/ {print $1,$6}')"
    # Internet speed test needs extra tool (eg speedtest).
    # It is very slow even in silent mode and is not worth the waiting time.
    #speedtest --progress=no --progress-update-interval=100 # Run it explicitly.
    echo $CPU_LOAD$RAM_USAGE$DISK_USAGE$IP_ADDRESS
}

PROMPT_COMMAND=system_stats
PS0="${adjust_output_border}"$OUTPUT_BORDER"\n"
PS1=$SYSTEM_INFO$USER_INFO

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

# Use lesspipe on top of less for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# TODO:check for.vim/pack/themes/start existance and download package if needed
gitBareRepo config status.showUntrackedFiles no
