#!/bin/sh

# TODO: change permission more elegant
chmod a+rwx /root/baidunetdisk
chmod a+rwx /root/baidunetdiskdownload

/usr/bin/vncserver -geometry 1600x1200 > /dev/null 2>&1
/opt/noVNC/utils/launch.sh --vnc localhost:5901 > /dev/null 2>&1 &
DISPLAY=:1 /opt/baidunetdisk/baidunetdisk

exit 0

