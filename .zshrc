# ! Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/benjo/.zshrc'

autoload -Uz compinit
compinit
# ! End of lines added by compinstall

# Exports
export PAGER='bat --paging=always'
export BAT_THEME="Dracula"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
path+=('/home/benjo/.local/bin')
path+=('/home/benjo/bin')
export PATH

# Aliases
alias less='bat --paging=always'
alias cat='bat --pager=never'
alias lsl='ls -l'
alias lsla='ls -l -a'

# Plugins
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh-plugins/themes/powerlevel10k/powerlevel10k.zsh-theme
