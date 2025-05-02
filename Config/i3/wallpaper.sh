#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers/New"
STATE_FILE="$HOME/.cache/wallpaper_index"

mapfile -t WALLPAPERS < <(find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | sort)

TOTAL=${#WALLPAPERS[@]}
if [[ $TOTAL -eq 0 ]]; then
  echo "No wallpapers found in $WALL_DIR"
  exit 1
fi

if [[ -f "$STATE_FILE" ]]; then
  INDEX=$(<"$STATE_FILE")
else
  INDEX=0
fi

if [[ $INDEX -ge $TOTAL ]]; then
  INDEX=0
fi

feh --bg-fill "${WALLPAPERS[$INDEX]}"

NEXT_INDEX=$(((INDEX + 1) % TOTAL))
echo $NEXT_INDEX >"$STATE_FILE"
