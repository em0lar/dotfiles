export PURE_GIT_PULL=0

export SSH_AGENT_PID=""
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export LANG=en_US.UTF-8

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

export EDITOR=nvim

alias cat="pridecat --pan"
alias tb="nc termbin.com 9999"
alias vim="nvim"
alias ip="ip -c"

