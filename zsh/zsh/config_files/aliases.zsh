alias ...='cd ../..'
alias ....='cd ../../..'
alias h='history 1 |g '
alias hinfo='history -iD'
alias vim='nvim'
alias nv='nvim'
alias init.vim='nvim ~/.config/nvim/init.vim'

alias trash='tree ~/.local/share/Trash'

mkcd () {
  mkdir -p "$*"
  cd "$*"
}

#
# Vagrant
alias vup='vagrant up'
alias vlist='vagrant box list'
alias vssh='vagrant ssh'
alias vstatus='vagrant global-status'
alias vprune='vagrant global-status --prune'
alias vsnap='vagrant snapshot'
alias vpack='vagrant package'
alias vhalt='vagrant halt'
alias vreload='vagrant reload'

#
# Git
alias gst='git status -s'
alias gaa='git add -A'
alias glol='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gco='git checkout'
alias gbr='git branch'
alias gci='git commit -m'
alias gcia='git commit -am'
alias glog='git log --oneline'
alias glbr='git branch --all'
alias galias='cat ~/.zsh/config_files/aliases.zsh |g git |g -v galias'
alias trw='tmux renamew'
alias lal='ls -a -l'

if [[ $(uname -s) == Linux ]]; then
  alias l='ls -F --color=auto'
  alias ll='ls -lF --color=auto'
  alias la='ls -aF --color=auto'
  alias g='grep -i --color=auto'
  if [[ $(lsb_release -a 2> /dev/null |awk '{ if ($1 == "Release:" ) print $2 }') == 16.04 ]]; then
    alias tmux='tmux-next'
  else
    alias tmux='tmux -2'
  fi
fi
if [[ $(uname -s) == FreeBSD ]]; then
  alias lst='ls -tG'
  alias l='ls -GF'
  alias ll='ls -lFG'
  alias la='ls -aGF'
  alias su='su -l'
  alias g='grep -i --color=auto'
  alias less='less -m'
  alias temp='sysctl -a |grep temper'
  alias pil='pkg info -l'
  alias pis='pkg search'
  alias tmux='tmux -2'
fi
if [[ $(uname -s) == OpenBSD ]]; then
  alias lst='colorls -Gt'
  alias l='colorls -GF'
  alias ll='colorls -lFG'
  alias la='colorls -aGF'
  alias su='su -l'
  alias g='ggrep -i --color=auto'
  alias less='less -m'
  alias tmux='tmux -2'
fi
