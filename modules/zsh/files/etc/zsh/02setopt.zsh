setopt appendhistory autocd extendedglob extended_history  hist_ignore_dups hist_expire_dups_first hist_find_no_dups hist_reduce_blanks nohup notify prompt_subst
unsetopt beep

autoload -U url-quote-magic
autoload dehup
autoload -U promptinit
promptinit

prompt wunjo

zle -N self-insert url-quote-magic

_force_rehash() {
	(( CURRENT == 1 )) && rehash
	return 1 # Because we didn't really complete anything
}

zstyle ':completion:::::' completer _force_rehash _complete _approximate
