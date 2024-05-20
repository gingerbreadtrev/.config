
# HOMEBREW ===================================================================================

eval "$(/opt/homebrew/bin/brew shellenv)"

# ============================================================================================

# CREATE PROMPT ==============================================================================

PS1="
%F{10}[%f%F{10}%n%f%F{red} %~%f%F{10}]%f%F{10} ❯%f "

# Use STARSHIP prompt
eval "$(starship init zsh)"

# ============================================================================================

# HISTORY ====================================================================================

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ============================================================================================

# OPTIONS ====================================================================================

set -o extendedglob

# ============================================================================================

# ALIASES ====================================================================================

alias py='python3'
alias python='python3'
alias pip='pip3'

alias sp='source $HOME/.config/zsh/.zshrc'
alias ls="eza --icons=always"
alias ll="eza --icons=always -al"

# ============================================================================================

# ADD FUNCTIONS TO PATH AND AUTOLOAD THEM ====================================================

fpath=($HOME/.config/zsh/functions $fpath)
typeset -U fpath # keeps only unique values on fpath

# autload, unfunction and then autoload so that source .zshrc will update the functions
autoload -Uz $fpath[1]/*(.:t)
unfunction $fpath[1]/*(.:t)
autoload -Uz $fpath[1]/*(.:t)

# ============================================================================================

# SOURCE ZSH CUSTOM FOLDER ===================================================================

for f ($HOME/.config/zsh/custom/**/*.zsh(N.)) . $f

# ============================================================================================

# ZSH HIGHLIGHT ==============================================================================

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
source $HOME/.config/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh

# ============================================================================================

# iTERM2 =====================================================================================

#source ~/.iterm2_shell_integration.zsh

# ============================================================================================
