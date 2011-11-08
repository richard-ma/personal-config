# Richard Ma's zsh prompt
local return_code="%(?..%{$fg[red]%}%?%{$reset_color%} )"

PROMPT='%{$fg_bold[yellow]%}┌─[ %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)$(svn_prompt_info)
%{$fg_bold[yellow]%}└─[ ${return_code}%# %{$reset_color%}'
RPROMPT='%{$fg_bold[red]%}$(vi_mode_prompt_info)%{$fg_bold[yellow]%}!%!%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
