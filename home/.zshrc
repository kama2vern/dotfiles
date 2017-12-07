# autoloads
fpath=($(brew --prefix)/share/zsh/site-functions "$HOME/.zsh/functions" $fpath)
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
export EDITOR=vi
export CLICOLOR=YES
export GOPATH=$HOME/go
export TERM=xterm-256color

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
compinit -u

# alias
alias ls="ls -G"
alias tmux="tmux -2"
alias o="git ls-files | peco | xargs open"
alias e='cd $(ghq list -p | peco)'
alias s='git status --short'
alias v='atom'
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

## function
a() { git add . $1 --all; git status --short }
k() { git grep -l $1 | xargs gsed -i -r -e "s;$1;$2;g" }
m() { git commit -m "$*" }

# Shell Debug
export PS4='+ (${BASH_SOURCE}:${LINENO}): ${FUNCNAME:+$FUNCNAME(): }'

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python
export PATH="$HOME/.pyenv/shims:$PATH"

# Go
export PATH="$GOPATH/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

## local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

