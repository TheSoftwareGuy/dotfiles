#colors for the prompt variables
# Reset
################################################################################
#                      Environment Variables                                   #
################################################################################
#TODO: add \[ and \] around each of these things. Maybe, is that needed?
bright=`echo -e "\x1b[1m"` 
dim=`echo -e "\x1b[2m"` 
underline=`echo -e "\x1b[4m"` 	
blink=`echo -e "\x1b[5m"` 
reverse=`echo -e "\x1b[7m"` 
hidden=`echo -e "\x1b[8m"` 

#	foreground colours
black=`echo -e "\x1b[30m"` 
red=`echo -e "\x1b[31m"` 
green=`echo -e "\x1b[32m"` 
yellow=`echo -e "\x1b[33m"` 
blue=`echo -e "\x1b[34m"` 
magenta=`echo -e "\x1b[35m"` 
cyan=`echo -e "\x1b[36m"` 
white=`echo -e "\x1b[37m"` 

#	background colours
bblack=`echo -e "\x1b[40m"` 
bred=`echo -e "\x1b[41m"` 
bgreen=`echo -e "\x1b[42m"` 
byellow=`echo -e "\x1b[43m"` 
bblue=`echo -e "\x1b[44m"` 
bmagenta=`echo -e "\x1b[45m"` 
bcyan=`echo -e "\x1b[46m"` 
bwhite=`echo -e "\x1b[47m"` 

norm=`echo -e "\x1B[0m"`       # Text Reset

autoload colors && colors


#ignore compiled python programs as tab completions
export FIGNORE=$FIGNORE::.pyc

export VISUAL='mvim -f'
export EDITOR="vim"

######################
# Unicode Characters #
######################
Triangle_RIGHT=`echo -e "\xE2\x96\xB6"`

################################################################################
#                      Macro Functions                                         #
################################################################################
#Macro functions


function AlertOnWifiUp {
	until ping -W1 -c1 google.com; do sleep 5; done && say the internet is back
}

function ql {
  qlmanage -p "$@" >& /dev/null &
}

function preprend {
	cat - "$*"
}

up() {
    cd $( printf '../%.0s' {1..${1:-1}} )
}
	


#enable colorized ls
export CLICOLOR=1



# add homebrew stuff to PATH
export PATH="/usr/local/Homebrew/bin:$PATH"
# aws cli auto-complete
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/opt/homebrew/bin/aws_completer' aws

# custom prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats ": (%{$reset_color%}%{$fg[green]%}%r%{$fg[white]%}/%{$fg[blue]%}%b%{$reset_color%}) %m%u%c%{$reset_color%}"
zstyle ':vcs_info:*' enable git svn



precmd () {
    last_exit_code=$?
    if [[ last_exit_code -eq 0 ]] ; then
        STATUS_PART='✅'
    else
        STATUS_PART="⚠️ ${red}${last_exit_code}${norm} ⚠️"
    fi
    

    vcs_info
     PS1="
${norm}${white}[${STATUS_PART}${white}] [${blue}%h${white}] ${white}[${cyan}$(date -Iseconds)${white}]${norm}
${cyan}%n${red}@${green}%m${norm}: ${norm}${white}(${yellow}${EKS_CLUSTER:-\$EKS_CLUSTER}${white}/${yellow}${AWS_REGION:-\$AWS_REGION}${white}/${yellow}${AWS_PROFILE:-\$AWS_PROFILE}${white})${norm}
${underline}${magenta}%~${norm}$vcs_info_msg_0_
${white}\$ ${norm}"
}

#"
################################################################################
#                      Helper files                                            #
################################################################################
# source ~/dotfiles/prompt_helper.sh
# source ~/git-completion.bash





################################################################################
#                      Command Aliases                                         #
################################################################################

###################
# General Aliases #
###################
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'


###############
# Fun aliases #
###############


###############
# Git aliases #
###############

alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias grep='grep --color=auto'

export PATH=/Users/jonathan.gillis/bin:$PATH



autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
