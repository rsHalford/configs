function set_win_title(){
  echo -ne "\033]0; $(echo $PWD) \007"
}
precmd_functions+=(set_win_title)

fpath=($XDG_DATA_HOME/zsh/zsh-completions/src $fpath)
source $XDG_DATA_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $XDG_DATA_HOME/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

HISTFILE=$HISTFILE/zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -U compinit && compinit
zmodload -i zsh/complist

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zle -N history-substring-search-up
zle -N history-substring-search-down

setopt autocd
setopt auto_pushd
setopt globdots
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history
setopt correct

bindkey -v
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=default,fg=magenta,underline'
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=yellow,underline'

alias p="sudo pacman"
alias y="yay"
alias v="nvim"
alias h="helix"
alias hx="helix"
alias mpv="mpv --wid=$WINDOWID"
alias abook="abook --config $XDG_CONFIG_HOME/abook/abookrc --datafile $XDG_DATA_HOME/abook/addressbook"
alias remind="remind -b1 -m -@0 -gaaaa"

alias mkdir="mkdir -pv"
alias cp="cp -i"
alias mv="mv -i"
#alias rm="rm -i"
alias ls="exa -lagh -s=.Name --time-style=iso --git --group-directories-first --colour-scale"
alias la="exa -T -L=3 --group-directories-first"
alias cat="bat"
alias grep="grep -i --color=auto --exclude-dir={.git,node_modules}"
#alias find="fd"
alias fd="fd -HI"
alias fzf="fzf -i --preview 'bat --color=always --style=numbers --line-range=:68 {}'"

alias ca="cd ~/.cache/"
alias cf="cd ~/.config/"
alias lc="cd ~/.local/"
alias lcb="cd ~/.local/bin/"
alias lcs="cd ~/.local/share/"
alias gos="cd ~/.local/share/go/src/github.com/rsHalford/"

alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcl='git clone'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gf='git fetch'
alias glg='git log --stat'
alias gm='git merge'
alias gmv='git mv'
alias gpl='git pull'
alias gps='git push'
alias grb='git rebase'
alias grm='git rm'
alias gst='git status -u'

alias config='/usr/bin/git --git-dir=/home/richard/.dotfiles/ --work-tree=/home/richard'
alias con='config'
alias cona='config add'
alias conaa='config add .'
alias conb='config branch'
alias conc='config commit -v'
alias concm='config commit -m'
alias conca='config commit --amend'
alias concl='config clone'
alias conco='config checkout'
alias concb='config checkout -b'
alias cond='config diff'
alias conf='config fetch'
alias conlg='config log --stat'
alias conm='config merge'
alias conmv='config mv'
alias conpl='config pull'
alias conps='config push'
alias conrb='config rebase'
alias conrm='config rm'
alias const='config status -u'

alias gof='gofmt -d -s -w .'
alias gob='go build -v'

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

eval "$(starship init zsh)"
