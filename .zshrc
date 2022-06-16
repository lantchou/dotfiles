# -------------------------------------------------------------------
# OH-MY-ZSH
# -------------------------------------------------------------------
# path to oh-my-zsh config
export ZSH="$HOME/.oh-my-zsh"

# set update reminder
zstyle ":omz:update" mode reminder  # just remind me to update when it's time

ZSH_THEME="robbyrussell"

# add timestamps to history command
HIST_STAMPS="mm/dd/yyyy"

COMPLETION_WAITING_DOTS="true"
# DISABLE_LS_COLORS="true"
# ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# LOCALE
# -------------------------------------------------------------------#
export LANG="en_US.UTF-8"

# -------------------------------------------------------------------
# EDITOR
# -------------------------------------------------------------------#
export VISUAL="vim"
export EDITOR="$VISUAL"

# -------------------------------------------------------------------
# ALIASES
# -------------------------------------------------------------------#
alias virc='vi ~/.vimrc'
alias covid='~/dev/corona-scraper-be/corona_scraper.py'
alias ssh-hpc='ssh -i ~/.ssh/hpc vsc43696@login.hpc.ugent.be'
alias vactivate='source venv/bin/activate'
alias rm='rm -i'

# -------------------------------------------------------------------
# OPENSSL
# -------------------------------------------------------------------#
export PATH="$PATH:/usr/local/opt/openssl@3/bin:"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"

