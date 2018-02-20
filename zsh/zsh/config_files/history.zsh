HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# don't enter duplicate events
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
# does not save commands into history when prepended with a space
setopt hist_ignore_space
#shows command before execution
setopt hist_verify
# new history lines are added to $HISTFILE as soon as they are entered
setopt inc_append_history
# save each command's beginning timestamp and duration to the history file
setopt extended_history
