# ZSH Prompt

setopt PROMPT_SUBST

prompt() {
     PROMPT="[%F{magenta}%n%f@%F{yellow}%m%f:%F{blue}%~%f] $(__git_ps1 "(%s) ")%(?.%F{green}%(!.#.$)%f.%F{red}%? %(!.#.$)%f) "
}

precmd_functions+=(prompt)
