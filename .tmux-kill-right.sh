#!/usr/bin/env bash
set -euo pipefail

cur=$(tmux display-message -p '#I')
tmux list-windows -F '#I' | sort -rn | while read -r i; do
  if [ "$i" -gt "$cur" ]; then
    tmux kill-window -t "$i"
  fi
done
