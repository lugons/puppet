shortword-command() {
	local WORDCHARS=${WORDCHARS//[\/.:;@# -_]}
	zle ${WIDGET#shortword-}
}

zle -N shortword-forward-word shortword-command
zle -N shortword-backward-word shortword-command
zle -N shortword-delete-word shortword-command
zle -N shortword-backward-delete-word shortword-command

bindkey "^[[3~" delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

case "$TERM"; in
    screen)
        bindkey "^[[1~" beginning-of-line
        bindkey "^[[4~" end-of-line
        bindkey "^[OC" shortword-forward-word
        bindkey "^[OD" shortword-backward-word
        bindkey "^[[3^" delete-word
        ;;
    xterm)
        bindkey "^[[H" beginning-of-line
        bindkey "^[[F" end-of-line
        bindkey "^[[1;5C" shortword-forward-word
        bindkey "^[[1;5D" shortword-backward-word
        bindkey "^[[3;5~" shortword-delete-word
        ;;
    rxvt|rxvt-unicode-256color)
        bindkey "^[[7~" beginning-of-line
        bindkey "^[[8~" end-of-line
        bindkey "^[Oc" shortword-forward-word
        bindkey "^[Od" shortword-backward-word
        bindkey "^H" shortword-backward-delete-word
        bindkey "^[[3^" shortword-delete-word
        ;;
    *)
        bindkey "^[[1~" beginning-of-line
        bindkey "^[[4~" end-of-line
        ;;
esac
