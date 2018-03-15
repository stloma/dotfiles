local ret_status="%(?:%{$fg[yellow]%}≻ :%{$fg_bold[red]%}≻ %s)"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
elif [[ $git_root == /home/lockwood ]]; then
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}


function prompt_context() {
  if [[ -n "$SSH_CLIENT" || $UID == 0 ]]; then
    echo "%{$fg[red]%}$USER@%m:"
  fi
}

PROMPT='$(prompt_context)%{$fg[magenta]%}$(get_pwd) $ret_status%{$reset_color%}$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⊁%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[022]%}≻%{$reset_color%} "
