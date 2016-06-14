#!/bin/bash

LOCALDATE=$(LANG="en_US.UTF-8" && date)

echo "***********************************"
echo "**** Starting nsdncmon watcher ****"
echo "***********************************"
echo "Local date: $LOCALDATE"

# note: uncomment and edit your own scripts with the tasks you want to run
watch_nsdncmon () {
while read NSDNCMON_OUT ; do
	[ "${NSDNCMON_OUT}" = "com.apple.screenIsLocked" ] && echo "Screen has been locked [${NSDNCMON_OUT}]" # && bash '/usr/local/bin/screenlock.sh'
	[ "${NSDNCMON_OUT}" = "com.apple.screenIsUnlocked" ] && echo "Screen has been unlocked [${NSDNCMON_OUT}]" # && bash '/usr/local/bin/screenunlock.sh'
	[ "${NSDNCMON_OUT}" = "com.apple.screensaver.didstart" ] && echo "Screen has been locked [${NSDNCMON_OUT}]" # && bash '/usr/local/bin/screensaverstart.sh'
	[ "${NSDNCMON_OUT}" = "com.apple.screensaver.didstop" ] && echo "Screen has been unlocked [${NSDNCMON_OUT}]" # && bash '/usr/local/bin/screensaverstop.sh'
	[ "${NSDNCMON_OUT}" = "com.apple.sessionDidMoveOffConsole" ] && echo "Screen has been locked [${NSDNCMON_OUT}]" # && bash '/usr/local/bin/sessionoff.sh'
	[ "${NSDNCMON_OUT}" = "com.apple.sessionDidMoveOnConsole" ] && echo "Screen has been unlocked [${NSDNCMON_OUT}]" # && bash '/usr/local/bin/sessionon.sh'
done
}

echo "Waiting for nsdncmon output..."
watch_nsdncmon

echo "**** Exiting ****"
killall nsdncmon
exit 1
