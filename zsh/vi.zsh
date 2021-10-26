bindkey '^v' edit-command-line
bindkey -v
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line

#bindkey -M vicmd "i" vi-insert
#bindkey -M vicmd "I" vi-insert-bol
#bindkey -M vicmd "h" vi-backward-char
#bindkey -M vicmd "l" vi-forward-char
#bindkey -M vicmd "n" down-line-or-history
#bindkey -M vicmd "p" up-line-or-history
#bindkey -M vicmd "u" undo
#bindkey -M vicmd "e" vi-forward-word-end
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
