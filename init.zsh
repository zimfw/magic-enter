if (( ! ${+MNML_ERR_COLOR} )) typeset -g MNML_ERR_COLOR=red
typeset -gi MNML_LAST_ERR

_prompt_mnml_precmd() {
  MNML_LAST_ERR=${?}
}

_prompt_mnml_buffer-empty() {
  if [[ -z ${BUFFER} ]]; then
    # draw infoline
    if (( MNML_LAST_ERR )) print -Pn '%F{${MNML_ERR_COLOR}}${MNML_LAST_ERR} '
    print -Pn '%(1j.%F{244}%j%f& .)%F{244}%n%f@%F{244}%m%f:'
    print -Pn %F{244}${${(%):-%~}//\//%f\/%F{244}}
    local -i a_files=$(command ls -Aq | command wc -l)
    local -i v_files=$(command ls -q | command wc -l)
    local -i h_files=$(( a_files - v_files ))
    print -Pn " %f[%F{244}${v_files}%f"
    if (( h_files )) print -Pn " (%F{244}${h_files}%f)"
    print ]
    # display magic enter
    if (( ${#dirstack} )) print -P %F{244}${${dirstack/${HOME}/\~}//\//%f\/%F{244}}%f
    command ls -F
    command git status -sb 2>/dev/null
    print -Pn ${PS1}
    zle redisplay
  else
    zle accept-line
  fi
}

autoload -Uz add-zsh-hook && add-zsh-hook precmd _prompt_mnml_precmd
zle -N buffer-empty _prompt_mnml_buffer-empty
bindkey '^M' buffer-empty
