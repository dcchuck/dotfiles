PROMPT='
%{$fg[black]%}%~%{$reset_color%} ${VIRTUAL_ENV:+%{$fg[blue]%\}$(virtualenv_prompt_info)%{$reset_color%\} }$(git_prompt_info)$(bzr_prompt_info)
%{$fg_bold[black]%}>%{$reset_color%} '

ZSH_THEME_VIRTUALENV_PREFIX="["
ZSH_THEME_VIRTUALENV_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
