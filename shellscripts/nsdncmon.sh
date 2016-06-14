#!/bin/bash

LOCALDATE=$(LANG="en_US.UTF-8" && date)

echo "***************************"
echo "**** Starting nsdncmon ****"
echo "***************************"
echo "Local date: $LOCALDATE"

echo "Piping to nsdncmonwatcher script..."
/usr/local/bin/nsdncmon 2>&1 | /usr/local/bin/nsdncmonwatch.sh

echo "**** Exiting ****"
killall nsdncmon
exit 1
