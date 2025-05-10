#!/bin/bash

if ! ping -c 1 8.8.8.8 &>/dev/null; then
  dunstify -t 3000 "No internet connection" "Please check your connection."
  exit 1
fi

source ~/.config/wofi/.venv/bin/activate
python3.11 ~/.config/wofi/scripts/gpt.py
