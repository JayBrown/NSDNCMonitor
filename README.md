![nsdncmon-platform-osx](https://img.shields.io/badge/platform-OS%20X-lightgrey.svg)
![nsdncmon-code-ObjC](https://img.shields.io/badge/code-ObjC-yellow.svg)
![nsdncmon-code-shell](https://img.shields.io/badge/code-shell-yellow.svg)
![nsdncmon-depend-gcc](https://img.shields.io/badge/dependency-gcc-green.svg)
[![nsdncmon-license](http://img.shields.io/badge/license-MIT+-blue.svg)](https://github.com/JayBrown/NSDNCMonitor/blob/master/license.md)

# NSDNCMonitor
**Monitor your NSDistributedNotificationCenter and run user scripts on predefined events**

This was originally published as **ScreenSaverMonitor** in 2013 by Josh Goebel [here](http://pastie.org/8013106), based on existing code from a discussion on [stackoverflow](http://stackoverflow.com/questions/16944434/monitoring-screensaver-events-in-osx/16947042).

I only added observers for moving on/off console, extended the package with helper scripts and a LaunchAgent. I renamed it **nsdncmon**, because in the end you can tweak the code to include the notifications you want to observe.

## Installation
* download [here](https://github.com/JayBrown/NSDNCMonitor/releases)
* use the prebuilt OS X 10.11.2 binary—if it works; it's unsigned—or build it yourself with `gcc -Wall nsdncmon.m -o nsdncmon -lobjc -framework Foundation`
* move `nsdncmon` to `/usr/local/bin`
* move the two shell scripts to `/usr/local/bin` and `chmod +x` them
* move the LaunchAgent (.plist) to `~/Library/LaunchAgents` and load it with `launchctl`

## Functionality
`nsdncmon` currently listens for the following events:
* start/stop screensaver
* move on/off console, i.e. suspend/continue CGSession
* lock/unlock screen

Note: for tasks to run when your computer goes to (or wakes from) sleep, you should install and configure the very helpful [SleepWatcher by Bernhard Baehr](http://www.bernhard-baehr.de).

## General Note
* The LaunchAgent takes into account the above-mentioned Sleepwatcher; if you don't have SleepWatcher installed/activated, you can set the agent to a default KeepAlive
* This whole thing is pointless if you don't extend `nsdncmonwatch.sh` and write some scripts yourself with the tasks you want to have performed
