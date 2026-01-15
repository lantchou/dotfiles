# ----------------------------
# Oh My Zsh Configuration
# ----------------------------

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="apple"
DISABLE_MAGIC_FUNCTIONS="true"
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
    k
    git
    autojump
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------
# Use same python virtual env from previous shell
# -------------------------------------------------
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate
fi

# Also set python environment for tmux
if [[ -n "$TMUX" ]]; then
    tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
fi

# ---------------
# Add stuff to PATH
# ---------------
eval "$(/opt/homebrew/bin/brew shellenv)" # homebrew
export PATH=~/.local/bin:$PATH
export PATH=$PATH:~/dev/flutter/bin # flutter
export PATH=~/.composer/vendor/bin:$PATH # composer
export PATH="$HOME/.local/nvim-macos/bin:$PATH" # nvim

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lanchugov/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lanchugov/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lanchugov/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lanchugov/dev/google-cloud-sdk/completion.zsh.inc'; fi

## Android SDK
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin

# ---------------
# Add stuff to PYTHONPATH
# ---------------
export PYTHONPATH=~/ugent/masterproef/DiffJPEG:$PYTHONPATH

# pnpm
export PNPM_HOME="/Users/lanchugov/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ---------------
# Go
# ---------------
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/Users/lanchugov/dev/golib
export PATH=$PATH:$GOPATH/bin
# export GOPATH=$GOPATH:/Users/lanchugov/dev:/Users/lanchugov/we-are

# ------------
# Aliases
# ------------
alias vi='lvim'
alias virc='vi ~/.vimrc'
alias python='python3'
alias pip='pip3'
alias rm='rm -i'
alias imgcat='~/dev/imgcat.sh'
alias bt='sudo pkill bluetoothd'
alias tmux='tmux -u' # tmux with utf-8 support
alias p='pnpm'

# ----------
# tmux session creation aliases
alias create-ssu='~/dev/create-ssu-seshes.sh'
alias create-repoint='~/dev/create-repoint-seshes.sh'
alias create-mia='~/dev/create-mia-seshes.sh'
alias create-mindlab='~/dev/create-mindlab-seshes.sh'
alias create-bugwise='~/dev/create-bugwise-seshes.sh'

# ------------------
# Git Aliases
# ------------------
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias grl='git reflog'
alias gch='git checkout'

# ------------------
# Docker Aliases
# ------------------
alias dcb='docker-compose up -d --build'
alias dcl='docker compose logs -f'
alias dcmm='docker compose exec web python manage.py makemigrations'
alias dcm='docker compose exec web python manage.py migrate --noinput'
alias dcf='docker compose exec web python manage.py flush --no-input'
alias dcld='docker compose exec web python manage.py loaddata db_data.json'
alias dcll='docker compose exec web python manage.py loaddata db_logs.json'
alias dct='dcf && dcld && docker compose exec web pytest -s'

# Set preferred editor
export EDITOR='nvim'
export VISUAL='nvim'

# Print out a random quote, told by a cow!
fortune | cowsay

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set locale
export LANG=en_US.UTF-8

# pyenv
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Enable shell integration
source ~/.iterm2_shell_integration.zsh


# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# nvm — keep this LAST so it wins PATH order over any other node version managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
