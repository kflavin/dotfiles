#!/bin/bash

if [[ $(cat /Users/kyleflavin/.zsh_history | wc -l) -gt $(cat /Users/kyleflavin/.zsh_history_backup | wc -l) ]]; then
    cp /Users/kyleflavin/.zsh_history /Users/kyleflavin/.zsh_history_backup;
fi
