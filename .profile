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
${red}   \$\$\$\$P d\$\$\$\$F \$ \$\$\$\$\$\$\$\$\$- \$\$\$\$\$\$        ${norm}User: $user
${red}   3\$\$\$F \"\$\$\$\$b   \$\"\$\$\$\$\$\$\$  \$\$\$\$*\"        ${norm}Hostname: $hostname
${red}    \$\$P\"  \"\$\$b   .\$ \$\$\$\$\$...e\$\$            ${norm}Distro: $distro
${red}     *c    ..    \$\$ 3\$\$\$\$\$\$\$\$\$\$eF          ${norm}Kernel: $kernel
${red}       %ce\"\"    \$\$\$  \$\$\$\$\$\$\$\$\$\$*           ${norm}Uptime: $uptime
${red}        *\$e.    *** d\$\$\$\$\$\"L\$\$             ${norm}Shell: $shell
${red}         \$\$\$      4J\$\$\$\$\$% \$\$\$             ${norm}Terminal: $terminal
${red}        \$\"'\$=e....\$*\$\$**\$cz\$\$\"             ${norm}Brew Packages: $packages
${red}        \$  *=%4.\$ L L\$ P3\$\$\$F              ${norm}CPU: $cpu
${red}        \$   \"%*ebJLzb\$e\$\$\$\$\$b              ${norm}Memory: $ram
${red}         %..      4\$\$\$\$\$\$\$\$\$\$              ${norm}Disk: $disk
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

alias HACK='cmatrix -C red'
#Just to scare the kids :)

#turn a typo into a laugh

#enable colorized ls
export CLICOLOR=1

##
# Your previous /Users/gillis/.profile file was backed up as /Users/gillis/.profile.macports-saved_2014-01-29_at_19:03:10
##

# MacPorts Installer addition on 2014-01-29_at_19:03:10: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

alias sls=sl

export PATH=/usr/local/bin:$PATH

