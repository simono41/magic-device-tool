#!/bin/bash
chmod +x . ./devices/e45/ubuntu/*.sh
clear
echo ""
echo "BQ Aquaris E4.5 - krillin"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo "[2] Screencast"
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/e45/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/e45/ubuntu/screencast.sh
elif [ "$option" = "3" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi