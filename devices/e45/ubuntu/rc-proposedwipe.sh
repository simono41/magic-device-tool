clear
echo ""
echo "Flashing rc-proposed channel"
echo ""
sleep 1
echo "Please boot your E4.5 into bootloader/fastboot mode by pressing Power & Volume Up (+)"
echo "and select fastboot mode"
echo ""
sleep 1
echo -n "Is your E4.5 in bootloader/fastboot mode now? [Y] "; read bootloadermode
if [ "$bootloadermode"==Y -o "$bootloadermode"==y -o "$bootloadermode"=="" ]; then
  clear
  echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  fastboot devices > /tmp/AttachedDevices
fi
  if grep 'device$\|fastboot$' /tmp/AttachedDevices
  then
    echo "Device detected !"
    sleep 1
    clear
    echo ""
    echo "Flashing rc-proposed channel"
    echo ""
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot reboot-bootloader
    sleep 6
    echo ""
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/recoverys/recovery-krillin.img
    sleep 1
    ubuntu-device-flash touch --channel ubuntu-touch/rc-proposed/bq-aquaris.en --device krillin --recovery-image $HOME/.cache/magic-device-tool/recovery-krillin.img  --bootstrap
    echo ""
    echo "Move to your device to finish the setup."
    sleep 1
    echo ""
    echo "Cleaning up.."
    rm -f /tmp/AttachedDevices
    #rm recovery-krillin.img
    echo ""
    sleep 1
    echo "Exiting magic-device-tool. Bye Bye"
    sleep 1
    exit
  else
    echo "Device not found"
    sleep 1
    rm -f /tmp/AttachedDevices
    echo ""
    echo "Back to menu"
    sleep 1
    . ./launcher.sh
  fi
