
export KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi

  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
  RPS2=$RPS1
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


#
# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}


setprompt() {
  # load some modules
  setopt prompt_subst

  # make some aliases for the colours: (coud use normal escap.seq's too)
  # for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  #   eval PR_$color='%{$fg[${(L)color}]%}'
  #   eval BL_$color='%{$fg_bold[${(L)color}]%}'
  # done
  # PR_NO_COLOR="%{$terminfo[sgr0]%}"

  # # Check the UID
  # if [[ $UID -ge 1000 ]]; then # normal user
  #   eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
  #   eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
  # elif [[ $UID -eq 0 ]]; then # root
  #   eval PR_USER='${PR_RED}"->"${PR_NO_COLOR}'
  #   eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
  # fi

  # # Check if we are on SSH or not
  # # if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  # if [[ -n "$SSH_CONNECTION" ]]; then
  #   eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
  # else
  #   eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
  # fi
  # set the prompt
  PS1=$'${PR_USER} ${BL_RED}%~ ${PR_NO_COLOR}'
  PS2=$'%_>'
  RPROMPT=$'${vcs_info_msg_0_}'
}
setprompt
