# ZSH Prompt

setopt PROMPT_SUBST

prompt() {
     PROMPT="[%B%F{magenta}%n%f%b@%B%F{yellow}%m%f%b:%F{blue}%~%f] $(__git_ps1 "(%s) ")%(?.%F{green}%(!.#.$)%f.%F{red}%? %(!.#.$)%f) "
}

precmd_functions+=(prompt)
