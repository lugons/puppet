zstyle ':completion:*' verbose yes
zstyle ':completion:*:list-prompt' format $'%{\e[0;31m%}TAB za dalje listanje{\e[0m%}'
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%}'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:cd:*' ignored-patters '(*/)#lost+found'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' squeeze-slashes true

autoload -Uz compinit
compinit
