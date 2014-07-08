#!/bin/bash
# Provides:          SnotraDaemon
# Required-Start:    $syslog
# Required-Stop:     $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Example SnotraDaemon
# Description:       Start/Stops Snotra Daemon

SOCKET="/tmp/.Snotra.Socket"
start() {
  echo "Starting SnotraDaemon"
  /usr/local/bin/SnotraDaemon > /dev/null &
  sleep 1
  chmod 666 $SOCKET
}

stop() {
  echo "Stopping SnotraDaemon"
  rm -rf $SOCKET
  pkill SnotraDaemon
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    retart)
        stop
        start
        ;;
    *)
echo "Usage: $0 {start|stop|restart}"
esac
exit 0
