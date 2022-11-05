# otherwise backspace, Tab, Del and arrow keys not working in terminal (using ssh)
export TERM=linux

# terminal prompt
export PS1="%{$fg[cyan]%}%n@%m %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)"

# path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(git vi-mode)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ls highlighting
export LS_COLORS=$LS_COLORS:"ow=36:"

# vim bindings
bindkey -v

# vim as default editor
export EDITOR=nvim
export VISUAL=nvim

# aliases
alias sudo='sudo -E env "PATH=$PATH"' # Save PATH for sudo
alias zshcfg="nvim ~/.zshrc"

## other
alias nvimconf='nvim ~/.config/nvim/init.lua'
alias packersync="nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
