
# Standard and additional keybindings:
#   ctrl + u     : clear line
#   ctrl + w     : delete word backward
#   alt  + d     : delete word
#   ctrl + a     : move to beginning of line
#   ctrl + e     : move to end of line (e for end)
#   alt/ctrl + f : move to next word (f for forward)
#   alt/ctrl + b : move to previous word (b for backward)
#   ctrl + d     : delete char at current position (d for delete)
#   ctrl + k     : delete from character to end of line
#   alt  + .     : cycle through previous args

# Vim mode
bindkey -v

bindkey '^ ' autosuggest-execute

#use alt+1, alt+2, etc, to bring up history
bindkey -s '^[1' "!:0 \t"
bindkey -s '^[2' "!:1 \t"
bindkey -s '^[3' "!:2 \t"
bindkey -s '^[4' "!:3 \t"

# Insert the output of the last command, github.com/tomsquest
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^[x' insert-last-command-output

bindkey '\ew' kill-region
# bindkey -s '\el' 'ls\n'
bindkey '^r' history-incremental-search-backward

bindkey ' ' magic-space

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

bindkey '^?' backward-delete-char
# Edit the current command line in $EDITOR
#autoload -U edit-command-line
#zle -N edit-command-line
#bindkey '\C-x\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^F' forward-char
bindkey '^B' backward-char
bindkey '^H' vi-backward-delete-char
bindkey '^D' delete-char
bindkey '^N' down-history
bindkey '^P' up-history
#bindkey '^R' history-incremental-search-backward
#bindkey '^?' backward-delete-char

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
