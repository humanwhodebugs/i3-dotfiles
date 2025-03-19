#!/usr/bin/env bash

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt="Screen Recorder"
mesg="DIR: Videos/Screenrecords"

if [[ ("$theme" == *'type-1'*) || ("$theme" == *'type-3'*) || ("$theme" == *'type-5'*) ]]; then
  list_col='1'
  list_row='2'
elif [[ ("$theme" == *'type-2'*) || ("$theme" == *'type-4'*) ]]; then
  list_col='2'
  list_row='1'
fi

# Options
layout=$(cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
  option_1="Start Recording"
  option_2="Stop Recording"
else
  option_1=""
  option_2=""
fi

# Rofi CMD
rofi_cmd() {
  rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -dmenu \
    -p "$prompt" \
    -mesg "$mesg" \
    -markup-rows \
    -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2" | rofi_cmd
}

# Start Recording
start_recording() {
  n=1
  while [[ -e "$HOME/Videos/Screenrecords/screen-recording-$n.mp4" ]]; do ((n++)); done
  gpu-screen-recorder -w screen -c mp4 -s 1366x768 -f 30 -bm qp -q very_high -k h264 -ac opus -a default_output -cursor no -keyint 2 -encoder cpu -o "$HOME/Videos/Screenrecords/screen-recording-$n.mp4" &
  notify-send -t 2000 "Screen Recorder" "Recording started: screen-recording-$n.mp4"
}

# Stop Recording
stop_recording() {
  if pgrep gpu-screen-recorder >/dev/null; then
    killall -SIGINT gpu-screen-recorder

    latest_recording=$(ls -t "$HOME/Videos/Screenrecords/"screen-recording-*.mp4 | head -n 1)
    notify-send -t 2000 "Screen Recorder" "Recording stopped.\nSaved to: $latest_recording"
  else
    notify-send -t 2000 "Screen Recorder" "No active recording found."
  fi
}

# Execute Command
run_cmd() {
  if [[ "$1" == '--opt1' ]]; then
    start_recording
  elif [[ "$1" == '--opt2' ]]; then
    stop_recording
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
  run_cmd --opt1
  ;;
$option_2)
  run_cmd --opt2
  ;;
esac
