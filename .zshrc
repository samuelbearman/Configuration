export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="apple2"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# export PATH="$PATH:$HOME/go/bin/:$HOME/.local/bin/:$HOME/dev/install/DynamoRIO-Linux-11.91.20504/bin64"

# alias ida="QT_SCALE_FACTOR=0.85 /home/sam/dev/install/ida/ida"

alias ls="eza"
alias lt="eza --tree"
alias vim="nvim"
alias fzf-p="fzf --preview \"bat --color=always --style=numbers --line-range=:500 {}\""

alias ll="ls -la --color=auto"
alias clanker="claude"

alias dark-clanker="claude --dangerously-skip-permissions"

# source $HOME/dev/zellij.sh

# cd $HOME/dev/

