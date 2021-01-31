# Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/home/coriolis/.zshrc'
autoload -Uz compinit
compinit

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups

# Globbing
setopt nomatch

# Sound
unsetopt beep

# Keys
bindkey -e
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       history-search-backward
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     history-search-forward
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# Prompt
autoload -U promptinit
promptinit
prompt adam2 8bit magenta green red white

# Var defs
export LANG=en_US.UTF-8
export EDITOR='vim'
export PAGER='most'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Aliases
alias please="sudo"
alias fuckin="sudo"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias sl="ls"
alias ll="ls -Alh"
alias rson="redshift -O 3400K"
alias rsoff="redshift -x"
alias resource="source ~/.zshrc"
alias xblon="xbacklight -set 100"
alias xbloff="xbacklight -set 0"
alias gdb="gdb -q"
alias amix="alsamixer"
alias watch="watch -c"
alias cpv="rsync -pogh --progress"
alias reatt="tmux attach-session -t"
alias objdump="objdump -M intel"
alias ccat="pygmentize -g"
alias kvim="vim -u ~/.kvimrc"
alias peda="gdb -ix ~/.pedainit"
alias update="yaourt -Syyu --noconfirm --aur"
alias mplayer="mplayer -msgcolor"
alias py="ipython"
alias py2="ipython2"
alias py3="ipython3"
alias cal="cal -m"
alias vcat="vimcat"
alias tree="tree -a"
alias xclip="xclip -selection clipboard"
alias rsync="rsync --progress"
alias curl="curl -s"
