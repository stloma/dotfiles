# shell
alias ...='cd ../..'
alias ....='cd ../../..'
alias h='history 1 |g '
alias hinfo='history -iD'
alias lal='ls -a -l'
alias pacsearch='pacman -Q |g '

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
alias gco='git checkout'
alias gci='git commit -m'
alias gcv='git commit -v'
alias gcia='git commit -am'
alias gbr='git branch'
alias glbr='git branch --all'
alias gcs='git config --local --list'
alias gd='git diff'
alias glog='git log -n 10 --oneline'
alias glst='git log --stat'
alias glol='git log --graph --decorate --pretty=oneline --abbrev-commit --all'

# tmux
alias trw='tmux renamew'
alias trn='tmux movew -r'

listening() {
  if [[ $(uname -s) == Linux ]]; then
    sudo netstat -tulpn
  fi
  if [[ $(uname -s) == Darwin ]]; then
    sudo lsof -i -P |grep LISTEN
  fi
}

# conditionals
if [[ $(uname -s) == Linux ]]; then
  alias l='ls -F --group-directories-first --color=auto'
  alias ll='ls -lF --group-directories-first --color=auto'
  alias la='ls -AF --group-directories-first --color=auto'
  alias g='grep -iI --color=auto'
  alias tmux='tmux -2'
fi
if [[ $(uname -s) == Darwin ]]; then
  alias l='ls -GF'
  alias ll='ls -lFG'
  alias la='ls -aGF'
  alias g='grep -i --colour=auto'
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
