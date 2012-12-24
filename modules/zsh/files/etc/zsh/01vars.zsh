export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export EDITOR='mcedit'
export PATH="/usr/lib/ccache/bin/:${PATH}"
export LC_COLLATE="POSIX"
export EDITOR=vim
export BROWSER=/usr/bin/chrome-incognito

if [ "${TERM}" != "linux" ]; then
    eval `dircolors /etc/DIR_COLORS.256`
fi
