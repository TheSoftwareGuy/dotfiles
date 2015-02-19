#colors for the prompt variables
# Reset

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


######################
# Unicode Characters
######################
Triangle_RIGHT=`echo -e "\xE2\x96\xB6"`

#Macro functions
archey()
{
# Variables
user=$(whoami)
hostname=$(hostname | sed 's/.local//g')
distro="OS X $(sw_vers -productVersion)"
kernel=$(uname)
uptime=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
shell="$SHELL"
terminal="$TERM"
packages="`brew list -l | wc -l | awk '{print $1 }'`"
cpu=$(sysctl -n machdep.cpu.brand_string)
mem=$(sysctl -n hw.memsize)
ram="$((mem/1000000000)) GB"
disk=`df | head -2 | tail -1 | awk '{print $5}'`

echo -e "
${red}          .ed\"\"\"\" \"\"\"\$\$\$\$be.
${red}        -\"           ^\"\"**\$\$\$e.
${red}      .\"                   '\$\$\$c
${red}     /                      \"4\$\$b
${red}    d  3                      \$\$\$\$
${red}    \$  *                   .\$\$\$\$\$\$
${red}   .\$  ^c           \$\$\$\$\$e\$\$\$\$\$\$\$\$.
${red}   d\$L  4.         4\$\$\$\$\$\$\$\$\$\$\$\$\$\$b
${red}   \$\$\$\$b ^ceeeee.  4\$\$ECL.F*\$\$\$\$\$\$\$
${red}   \$\$\$\$P d\$\$\$\$F \$ \$\$\$\$\$\$\$\$\$- \$\$\$\$\$\$        ${green}User: $user
${red}   3\$\$\$F \"\$\$\$\$b   \$\"\$\$\$\$\$\$\$  \$\$\$\$*\"        ${green}Hostname: $hostname
${red}    \$\$P\"  \"\$\$b   .\$ \$\$\$\$\$...e\$\$            ${green}Distro: $distro
${red}     *c    ..    \$\$ 3\$\$\$\$\$\$\$\$\$\$eF          ${green}Kernel: $kernel
${red}       %ce\"\"    \$\$\$  \$\$\$\$\$\$\$\$\$\$*           ${green}Uptime: $uptime
${red}        *\$e.    *** d\$\$\$\$\$\"L\$\$             ${green}Shell: $shell
${red}         \$\$\$      4J\$\$\$\$\$% \$\$\$             ${green}Terminal: $terminal
${red}        \$\"'\$=e....\$*\$\$**\$cz\$\$\"             ${green}Brew Packages: $packages
${red}        \$  *=%4.\$ L L\$ P3\$\$\$F              ${green}CPU: $cpu
${red}        \$   \"%*ebJLzb\$e\$\$\$\$\$b              ${green}Memory: $ram
${red}         %..      4\$\$\$\$\$\$\$\$\$\$              ${green}Disk: $disk
${red}          \$\$\$e   z\$\$\$\$\$\$\$\$\$\$ 
${red}           \"*\$c  \"\$\$\$\$\$\$\$P\"
${red}             \"\"\"*\$\$\$\$\$\$\$\"
${norm}
"
}

alert()
{
	if [ $# -gt 0 ]
	then
        growlnotify -m "$1"
	else
    	growlnotify -m "Alert"
	fi
}

function AlertOnWifiUp {
	until ping -W1 -c1 google.com; do sleep 5; done && say the internet is back
}

function ql(){
  qlmanage -p "$@" >& /dev/null &
}

#Exclamatories
function yeah(){
  afplay /Users/gillis/Music/misc/YEAH\ BITCH.m4a
}
function bitch(){
	yeah
}
function right(){
	afplay "/Users/gillis/Music/misc/Heisenberg. 'You're Goddamn Right!' Breaking Bad Season 5  Walter White-07wuZ3EWMAA.m4a"
}
fuck(){
	afplay ~/Music/misc/Fuck\ YOU.mp3
}
pfind(){
	ps -A | grep -i $*
}
preprend(){
	cat - "$*"
}
	
#Just to scare the kids :)
alias HACK='cmatrix -C red'

#turn a typo into a laugh

#enable colorized ls
export CLICOLOR=1

##
# Your previous /Users/gillis/.profile file was backed up as /Users/gillis/.profile.macports-saved_2014-01-29_at_19:03:10
##

# MacPorts Installer addition on 2014-01-29_at_19:03:10: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#this is for the depot_tools thing that the v8 guys use
export PATH="/Users/gillis/Projects/depot_tools:${PATH}"
export PATH=/usr/local/bin:$PATH

alias sls=sl


alias reponame='git rev-parse --show-toplevel'
#awesome prompt
export GIT_PROMPT='${bright}\[${magenta}\]$(basename $( git rev-parse --show-toplevel 2>/dev/null ) 2>/dev/null )${norm}\[${red}\]➤ ${bright}\[${green}\]`git rev-parse --abbrev-ref HEAD 2>/dev/null`\[${norm}\]'

#old prompt
#export PS1='\[${norm}\]\[${blue}\]\u\[${red}\]@\[${green}\]\h :\[${blue}\]\W \[${red}\]\$\[${norm}\] '

export PS1="\[\e[00;34m\]\u\[\e[0m\]\[\e[00;31m\]@\[\e[0m\]\[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\][\[\e[0m\]\[\e[00;35m\]\$?\[\e[0m\]\[\e[00;31m\]]\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\]{\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;36m\]\d\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[01;36m\]\t\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\]}\[\e[0m\] ${GIT_PROMPT} \[\e[00;37m\] \[\e[0m\]\[\e[00;31m\]:\[\e[0m\]\[\e[00;34m\]\w\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\\n\[\e[00;33m\]\\$\[\e[0m\]\[\e[00;31m\] \[\e[0m\]"

#export PS1="\[\e[00;34m\]\u\[\e[0m\]\[\e[00;31m\]@\[\e[0m\]\[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\][\[\e[0m\]\[\e[00;35m\]\$?\[\e[0m\]\[\e[00;31m\]]\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\]{\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[01;36m\]\d\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;36m\]\t\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\]}\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\]:\[\e[0m\]\[\e[00;34m\]\w\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\]\\$ \[\e[0m\]
#"


#ignore compiled python programs as tab completions
export FIGNORE=$FIGNORE::.pyc

export EDITOR='mvim'

#setup git tab-completion
source ~/git-completion.bash
alias gs='git status'
alias gd='git diff'
alias grep='grep --color'



