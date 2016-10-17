#!/bin/bash

declare -i ID
declare -i STATE

ID=`xinput list | grep -i 'touchpad' | sed -E 's/.*id=([0-9]+).+/\1/'`
STATE=`xinput list-props $ID | grep 'Device Enabled' | awk '{print $4}'`

if [ $STATE -eq 1 ]
then
  xinput disable $ID
  echo "Touchpad disabled."
else
  xinput enable $ID
  echo "Touchpad enabled."
fi
