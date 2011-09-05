# Other Possible Prompt Characters
# ○ ≻ λ ▷ ❯

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '▻'
}

function hg_prompt_info {
    hg prompt --angle-brackets "\
<%{$fg[magenta]%}<branch>%{$reset_color%}>\
<%{$fg[green]%} at <bookmark>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>
 " 2>/dev/null
}

PROMPT=$'$(hg_prompt_info)$(git_prompt_info)$(prompt_char) '
RPROMPT=$'%{$fg_bold[green]%}${PWD/#$HOME/~}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
