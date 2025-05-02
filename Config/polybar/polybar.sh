#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

CONFIG=$1

if [[ "$CONFIG" == "floating" ]]; then
  polybar mybar -c ~/.config/polybar/floating.ini &
elif [[ "$CONFIG" == "full" ]]; then
  polybar mybar -c ~/.config/polybar/full.ini &
fi
