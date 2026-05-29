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
alias fzf-h='result=$(history | fzf --tac --prompt="History> " | sed "s/^[ 0-9]*//"); [ -n "$result" ] && echo -n "$result" | xclip -selection clipboard'

alias ll="ls -la --color=auto"
alias clanker="CLAUDE_CODE_NO_FLICKER=1 claude"

alias dark-clanker="CLAUDE_CODE_NO_FLICKER=1 claude --dangerously-skip-permissions"

alias clear=':'

# source $HOME/dev/zellij.sh

# cd $HOME/dev/


# bun completions
[ -s "/var/home/sam/.bun/_bun" ] && source "/var/home/sam/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
