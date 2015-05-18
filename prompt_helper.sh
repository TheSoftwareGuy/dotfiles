
alias reponame='git rev-parse --show-toplevel'

PATH_COLOR="${blue}${underline}"
SEP_COLOR="${red}"
DATE_COLOR="$cyan"
TIME_COLOR="${cyan}${bold}"

HOST_COLOR="${blue}"
USER_COLOR="${blue}"

GIT_PROMPT_NORM="${norm}${underline}${bright}"
GIT_REPO_COLOR="${magenta}"
GIT_BRANCH_COLOR="${green}"

#GIT PROMPT SEGMENT


#for creating the Git protion of the prompt
export GIT_PROMPT='\[${GIT_PROMPT_NORM}\]\[${GIT_REPO_COLOR}\]$(basename $( git rev-parse --show-toplevel 2>/dev/null ) 2>/dev/null )${GIT_PROMPT_NORM}${SEP_COLOR}➤ ${GIT_PROMPT_NORM}${GIT_BRANCH_COLOR}$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\[${norm}\]'



export PS1="\[\e[0;34m\]${underline}\w${norm}\[\e[0;31m\] [\[\e[0;33m\]\$?\[\e[0;31m\]] \[\e[0;31m\]{\[\e[0;36m\]\d \[\e[0;36m\]${bright}\T\[\e[0;31m\]} \[\e[0;34m\]\u\[\e[0;31m\]@\[\e[0;32m\]\h\[\e[0;31m\]:\[\e[0;37m\]${GIT_PROMPT} \[\e[0m\]
\[${norm}\]\[${red}\]\$ \[${norm}\]"


