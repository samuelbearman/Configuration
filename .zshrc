export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="apple2"

plugins=(git)

source $ZSH/oh-my-zsh.sh


export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

alias bat="batcat"
alias ls="eza"
alias lt="eza --tree"
alias vim="nvim"
alias fzf-p="fzf --preview \"batcat --color=always --style=numbers --line-range=:500 {}\""