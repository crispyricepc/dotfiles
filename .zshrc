# Source zinit
source ~/.zinit/bin/zinit.zsh
fpath+=~/.zfunc

# ![ZSH] Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/benjo/.zshrc'

autoload -Uz compinit
compinit
# ![ZSH] End of lines added by compinstall

### Begin User Configuration

# Aliases and Exports
# If the bat (cat alternative) command is found
if command -v bat &> /dev/null
then
    # export PAGER='bat --paging=always'
    export BAT_THEME="Dracula"
    # export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    # alias less='bat --paging=always'
    alias cat='bat --pager=never'
fi
path+=('/home/benjo/bin')
path+=('/home/benjo/.cargo/bin')
export PATH

# If the exa (ls alternative) command is found
if command -v exa &> /dev/null
then
    alias exa='exa --git-ignore'
    alias ls='exa -h'
    alias tree='exa --tree --git-ignore'
fi

alias todo='todo.sh'

# Copied straight from .bashrc
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Plugin configuration
zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \

eval $(starship init zsh)

### End User Configuration

# Fetch if a fetch is installed
if command -v pfetch &> /dev/null && [ "$TERM_PROGRAM" != "vscode" ]
then
    pfetch
fi

export FrameworkPathOverride=/lib/mono/4.5
export PATH="$HOME/.poetry/bin:$PATH"

# Startup
if [[ -z $display ]] && [[ $(tty) = /dev/tty1 ]]
then
  startx >/dev/null 2>/dev/null
fi

