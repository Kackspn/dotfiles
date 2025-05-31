#!/bin/bash

BACKLIGHT="/sys/class/backlight/intel_backlight/brightness"

MIN=9600
MAX=96000
STEP=960

CUR=$(cat "$BACKLIGHT")
NEW=$((CUR + STEP))


if ((NEW >= MAX)); then
  NEW=$MAX
fi
echo "$NEW" > "$BACKLIGHT"


PER=$((NEW * 100 / MAX))
if ((PER < 0)); then PER=0; fi
if ((PER > 100)); then PER=100; fi
notify-send -t 1500 -u low "Brightness" "Level: ${PER}%" -h int:value:"$PER" -h string:x-canonical-private-synchronous:brightness_notif


exit 0
