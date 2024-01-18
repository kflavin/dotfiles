#!/bin/bash

if [[ $(cat /Users/kyleflavin/.zsh_history | wc -l) -gt $(cat /Users/kyleflavin/.zsh_history_backup | wc -l) ]]; then
    cp /Users/kyleflavin/.zsh_history /Users/kyleflavin/.zsh_history_backup
    cp /Users/kyleflavin/.zsh_history /Users/kyleflavin/.zsh_history_backup_"$(date '+%Y-%m-%d_%H:%M:%S')"
    find /Users/kyleflavin -maxdepth 1 -name ".zsh_history_backup_*" | sort -r | tail -n +200 | xargs -I{} rm {}
fi
