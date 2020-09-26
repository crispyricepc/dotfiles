# ![POWERLEVEL10K] Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Vars
# POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Exports
# If the bat (cat alternative) command is found
if command -v bat &> /dev/null
then
    export PAGER='bat --paging=always'
    export BAT_THEME="Dracula"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
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

### End User Configuration

# ![POWERLEVEL10K] To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
