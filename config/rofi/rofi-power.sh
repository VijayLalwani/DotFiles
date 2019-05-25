#!/usr/bin/env bash

OPTIONS="Reboot\nShut-down\nSuspend\nLock"

# source configuration or use default values
  LAUNCHER="rofi -location 5 -yoffset -40 -xoffset -10 -width 10 -lines 4 -dmenu -i -p power -show-icons -drun-icon-theme Papirus-Dark "
  USE_LOCKER="true"
  LOCKER="i3lock"


# Show exit wm option if exit command is provided as an argument
if [ ${#1} -gt 0 ]; then
  OPTIONS="Exit window manager\n$OPTIONS"
fi

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Exit)
        eval $1
        ;;
      Reboot)
        systemctl reboot
        ;;
      Shut-down)
        systemctl poweroff
        ;;
      Suspend)
	systemctl suspend
        ;;
      Lock)
        $($USE_LOCKER) && "$LOCKER"
        ;;
      *)
        ;;
    esac
fi
