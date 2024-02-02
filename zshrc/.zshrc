# Zsh main config

# General settings

# path to  oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(docker-compose git)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ls highlighting
# export LS_COLORS=$LS_COLORS:"ow=36:"

# vim bindings
# bindkey -v

# vim as default editor
export EDITOR=nvim
export VISUAL=nvim

# Functions

# teleport with kitty
function tshssh {
  TERM=xterm-256color tsh ssh $INSALES_USER@$1
}

# Aliases

# alias sudo='sudo -E env "PATH=$PATH"' # Save PATH for sudo
# alias zshcfg="nvim ~/.zshrc"
# alias trl="tree -LhaC 3"
# alias cdf="cd \$(find * -type d | fzf)"
# alias vif="nvim \$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')"

alias ngrok-start="ngrok http 80 --domain=$NGROK_DOMAIN"

# inSales
alias insales-attach=$INSALES_ATTACH_COMMAND
alias insales-bash=$INSALES_BASH_COMMAND
alias insales-console=$INSALES_CONSOLE_COMMAND
alias insales-logs=$INSALES_LOGS_COMMAND
alias insales-postgres=$INSALES_POSTGRES_COMMAND
alias insales-restart=$INSALES_RESTART_COMMAND
alias insales-sidekiq=$INSALES_SIDEKIQ_COMMAND
alias insales-start=$INSALES_START_COMMAND
alias insales-stop=$INSALES_STOP_COMMAND
alias insales="cd $INSALES_DIR"

# URL-s
alias bro770="xdg-open '$INSALES_BRO770_LOGIN_URL'"
alias daily-meeting="xdg-open '$DAILY_MEETING_URL'"
alias insales-gitlab="xdg-open '$INSALES_GITLAB_URL'"
alias insales-gitlab-master-piplines="xdg-open '$INSALES_GITLAB_MASTER_PIPLINES_URL'"
alias insales-gitlab-free-stagings="xdg-open '$INSALES_GITLAB_STOPPED_STAGINGS_URL'"
alias insales-mr="xdg-open '$INSALES_GITLAB_MY_OPEN_MERGE_REQUESTS_URL'"
alias pt-scrum="xdg-open '$INSALES_PT_SCRUM_URL'"

## edit/source config
alias nvimconf='nvim ~/.config/nvim/'
alias source-zsh="source ~/.zshenv && source ~/.zshrc"

alias mm='mattermost-desktop'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Insales letsdev
alias letsdev=$INSALES_LETSDEV_REPO/letsdev.rb
. $INSALES_LETSDEV_REPO/bash-completions
