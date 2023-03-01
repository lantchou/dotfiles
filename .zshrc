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
alias gch='git checkout --'

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
export EDITOR='vim'
export VISUAL='vim'

# Fortune cowsay hehe
fortune | cowsay
