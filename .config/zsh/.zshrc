# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Vi Mode
bindkey -v

# Set up the prompt
autoload -Uz promptinit
promptinit

setopt autocd

# Keep 1000 lines of history within the shell and save it to ~/.local/share/history/zsh_history:
HISTFILE=~/.local/share/history/zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE


# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Alias
alias ls="ls --color=auto"
alias la="ls -hgGA  --time-style=+'%e %b %y %H:%M' --color=always --group-directories-first | sed -re 's/^[^ ]* //'"
alias cp="cp -iv"
alias mv="mv -iv"
#alias rm="rm -iv"
alias ..="cd .."
alias p="sudo pacman"
alias v="nvim"
alias cf="cd ~/.config/"
alias lc="cd ~/.local/"
alias lcs="cd ~/.local/share/"
alias lcb="cd ~/.local/bin/"
alias ca="cd ~/.cache/"

# Zsh History Substring Search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Zsh Syntax Highlighting
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=purple,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=magenta,bold'

zle -N history-substring-search-up; zle -N history-substring-search-down

# ZSH-AUTOSUGGESTIONS: source
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH-SYNTAX-HIGHLIGHTING: source
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH-HISTORY-SUBSTRING-SEARCH: source
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# POWERLEVEL10K: source
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/powerlevel10k/internal/p10k.zsh ]] || source ~/powerlevel10k/internal/p10k.zsh
alias config='/usr/bin/git --git-dir=/home/richard/.dotfiles/ --work-tree=/home/richard'
