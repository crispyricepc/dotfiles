# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source zinit
source ~/.zinit/bin/zinit.zsh

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

# Exports
# If the bat (cat alternative) command is found
if command -v bat &> /dev/null
then
    export PAGER='bat --paging=always'
    export BAT_THEME="Dracula"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
path+=('/home/benjo/.local/bin')
path+=('/home/benjo/.local/applications/Qt/Tools/QtCreator/bin')
path+=('/home/benjo/bin')
export PATH

# Aliases
alias less='bat --paging=always'
alias cat='bat --pager=never'
alias lsl='ls -l'
alias lsla='ls -l -a'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Plugins
# Powerlevel10k
zplugin ice depth=1; zplugin light romkatv/powerlevel10k
zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \

### End User Configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Startup
if [[ -z $display ]] && [[ $(tty) = /dev/tty1 ]]
then
  startx >/dev/null 2>/dev/null
fi