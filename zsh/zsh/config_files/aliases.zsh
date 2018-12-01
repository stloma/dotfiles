# shell
alias ...='cd ../..'
alias ....='cd ../../..'
alias h='history 1 |g '
alias hinfo='history -iD'
alias lal='ls -a -l'

mkcd () {
  mkdir -p "$*"
  cd "$*"
}

cl () {
  cd "$*"
  l
}

# system

alias sc='systemctl'
alias scu='systemctl --user'
alias jc='journalctl'
alias jcu='journalctl --user'

# apps

alias vim='nvim'
alias nv='nvim'
alias init.vim='nvim ~/.config/nvim/init.vim'
alias tree='tree -C'

alias b2='backblaze-b2'

pw () {
  pass=$(bw get password "$*")

  if [[ $pass == "Vault is locked." ]] ||
     [[ $pass == "You are not logged in." ]] ||
     [[ $pass == "Not found." ]] ||; then
      echo $pass
      return 1
  fi

  echo $pass | xclip -selection clipboard
  echo "Copied to clipboard"
}

alias trash='tree ~/.local/share/Trash'

# kinto
alias kflush='http POST "127.0.0.1:8888/v1/__flush__" --verbose'
alias kperms='http -b 127.0.0.1:8888/v1/permissions'

kput () {
  http -b put 127.0.0.1:8888/v1/buckets/"$*"
}

# vagrant
alias vup='vagrant up'
alias vlist='vagrant box list'
alias vssh='vagrant ssh'
alias vstatus='vagrant global-status'
alias vprune='vagrant global-status --prune'
alias vsnap='vagrant snapshot'
alias vpack='vagrant package'
alias vhalt='vagrant halt'
alias vreload='vagrant reload'

# docker
alias drm='docker rm'
alias drmimage='docker rmi'
alias dimages='docker images'
alias drun='docker run'
alias drunit='docker run -it'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dinspect='docker inspect'
alias dtop='docker top'
alias dstop='docker stop'
alias dstats='docker stats'

# git
alias gst='git status -s'
alias gaa='git add -A'
alias glol='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gco='git checkout'
alias gbr='git branch'
alias gci='git commit -m'
alias gcia='git commit -am'
alias glog='git log --oneline'
alias glbr='git branch --all'
alias gsc='git config --local --list'
alias galias='cat ~/.zsh/config_files/aliases.zsh |g git |g -v galias'
alias gl='git log --oneline -n 10'
alias gd='git diff'

# tmux
alias trw='tmux renamew'
alias trn='tmux movew -r'

# conditionals
if [[ $(uname -s) == Linux ]]; then
  alias l='ls -F --group-directories-first --color=auto'
  alias ll='ls -lF --group-directories-first --color=auto'
  alias la='ls -AF --group-directories-first --color=auto'
  alias g='grep -iI --color=auto'
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
