# NOTE: configure ZSH history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# NOTE: see https://unix.stackexchange.com/questions/389881/history-isnt-preserved-in-zsh#comment858751_470707
setopt INC_APPEND_HISTORY_TIME

# NOTE, history search, see: https://wiki.archlinux.org/title/Zsh#History_search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# NOTE: modifier keys, see: https://unix.stackexchange.com/a/140499
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# NOTE: delete words, see: https://unix.stackexchange.comfez/a/583783
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

# NOTE: zim, see: https://zimfw.sh/docs/install/
ZIM_HOME=~/.zim

# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh
