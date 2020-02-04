local ret_status="%(?:%{$fg_bold[black]%} :%{$fg_no_bold[red]%} %s)"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

function prompt_context() {
  if [[ -n "$SSH_CLIENT" ]]; then
    if [[ $UID == 0 ]]; then
        echo "%{$fg[red]%}root@%m:"
    else
      echo "%{$fg[red]%}$USER@%m:"
    fi
  elif [[ $UID == 0 ]]; then
    echo "%{$fg[red]%}root  "
  fi
}

# precmd() { print "" }

PROMPT='$(prompt_context)%{$fg_no_bold[green]%}$(get_pwd) $ret_status%{$reset_color%}$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_no_bold[red]%}%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[247]%}%{$reset_color%} "
