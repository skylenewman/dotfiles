if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
PS1="\n\e[1;34m[\u   @   \h   \D{%F   %T}]\n\w\e[m\n> "
PS1="\n\e[1;34m[\u   \D{%F   %T}]\n\w\e[m\n> "
#PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\\n\e[1;34m[\u   \D{%F   %T}]\n\w\e[m\n> [\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "


PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
  #PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
#PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'
source ~/.bash/git-prompt.sh # Show git branch name at command prompt
export GIT_PS1_SHOWCOLORHINTS=true # Option for git-prompt.sh to show branch name in color

# Terminal Prompt:
# Include git branch, use PROMPT_COMMAND (not PS1) to get color output (see git-prompt.sh for more)
# export PROMPT_COMMAND='__git_ps1 "\w" "\033]0;${PWD##*/}\007\n\\\$ "' # Git branch (relies on git-prompt.sh)
function __my_prompt {
    __git_ps1 "\w" "\033]0;${PWD##*/}\007 \n\\\$ "
}
export PROMPT_COMMAND='__git_ps1 "\w" "\033]0;${PWD##*/}\007 \n\\\$ "' # Git branch (relies on git-prompt.sh)
# export PROMPT_COMMAND='__my_prompt'
function my_function {
    __git_ps1 "\w" "\033]0;${PWD##*/}\007\n\\\$ "
    PS1="\n\e[1;34m[\u   \D{%F   %T}]\n\w\e[m\n> "
    echo -ne "\033]0;${PWD##*/}\007"
    # echo -ne "Test:I am in myfunc"
}

# export PROMPT_COMMAND="my_function;$PROMPT_COMMAND"

alias la='ls -alh'
alias dir='ls -d */'
alias rm='echo "rm is dangerous; use trash; if you are sure of what you want to remove, use /sbin/rm"'
alias cpi='cp -i'
alias cp='cp'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
alias l='ls -l'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias ......='cd ../../../../../../'
alias .......='cd ../../../../../../../'
alias ........='cd ../../../../../../../../'
alias .........='cd ../../../../../../../../../'
alias bk='cd -'

alias greppr='ps -ef | grep'
alias cls='clear;ls'
alias grep='grep --color'
alias paks="bundle exec pakyow server"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=~/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
### tmux
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function proml {

  local        BLUE="\[\033[0;34m\]"

# OPTIONAL - if you want to use any of these other colors:

  local         RED="\[\033[0;31m\]"

  local   LIGHT_RED="\[\033[1;31m\]"

  local       GREEN="\[\033[0;32m\]"

  local LIGHT_GREEN="\[\033[1;32m\]"

  local       WHITE="\[\033[1;37m\]"

  local  LIGHT_GRAY="\[\033[0;37m\]"

# END OPTIONAL

  local     DEFAULT="\[\033[0m\]"

  PS1="\W \$(parse_git_branch) $DEFAULT\$ "
}

#proml
