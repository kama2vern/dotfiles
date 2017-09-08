# autoloads
fpath=("$HOME/.zsh/functions" $fpath)
autoload -Uz colors
autoload -Uz add-zsh-hook
autoload -Uz compinit
autoload -Uz history-search-end
autoload -Uz my_rprompt
autoload -Uz my_copyline

# setopt
setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_MENU
setopt EXTENDED_GLOB
setopt HIST_EXPAND
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt LIST_TYPES
setopt MAGIC_EQUAL_SUBST
setopt PUSHD_IGNORE_DUPS
setopt TRANSIENT_RPROMPT

# variables
export LANG=ja_JP.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export EDITOR=vim
export CLICOLOR=YES
export GOPATH=$HOME/go

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# keybinds
bindkey -e
if zle -la | grep -q '^history-incremental-pattern-search'; then
  bindkey '^R' history-incremental-pattern-search-backward
  bindkey '^S' history-incremental-pattern-search-forward
fi

# executions
colors
my_rprompt
my_copyline

# prompt
PROMPT="%{${fg[yellow]}%}$%{${reset_color}%} "

# completion
zstyle ':completion:*:default' menu select

# alias
alias ls="ls -G"
alias tmux="tmux -2"
alias o="git ls-files | peco | xargs open"
alias e='cd $(ghq list -p | peco)'
alias s='git status --short'
alias v='atom'

## function
a() { git add . $1 --all; git status --short }
B() { git branch | peco | sed -e "s/^\*[ ]*//g" }
k() { git grep -l $1 | xargs gsed -i -r -e "s;$1;$2;g" }
m() { git commit -m "$*" }

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python
export PATH="$HOME/.pyenv/shims:$PATH"

# direnv
eval "$(direnv hook zsh)"

## local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export EDITOR=vi
