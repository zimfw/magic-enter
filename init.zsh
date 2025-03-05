if (( ! ${+MNML_ERR_COLOR} )) typeset -g MNML_ERR_COLOR=red
typeset -gi MNML_LAST_ERR

_prompt_mnml_precmd() {
  MNML_LAST_ERR=${?}
}

_prompt_mnml_buffer-empty() {
  if [[ -z ${BUFFER} && ${CONTEXT} == start ]]; then
    # draw infoline
    if (( MNML_LAST_ERR )) print -Pn '%F{${MNML_ERR_COLOR}}${MNML_LAST_ERR} '
    print -Pn '%(1j.%F{244}%j%f& .)%F{244}%n%f@%F{244}%m%f:'
    print -P %F{244}${${(D)PWD}//\//%f\/%F{244}}
    # display magic enter
    if (( ${#dirstack} )) print -P %F{244}${${(D)dirstack}//\//%f\/%F{244}}%f
    ls -AF
    command git status -sb --untracked-files=no 2>/dev/null
    print -Pn ${PS1}
    zle redisplay
  else
    zle accept-line
  fi
}

autoload -Uz add-zsh-hook && add-zsh-hook precmd _prompt_mnml_precmd
zle -N buffer-empty _prompt_mnml_buffer-empty
bindkey '^M' buffer-empty
