#!/usr/bin/env bash

# Default directories
USERDATA_DIR=$HOME/baidunetdisk
DOWNLOAD_DIR=$HOME/baidunetdiskdownload

if [ $# != 2 ] ; then
  echo "Directories for user data and download not provided. Using default directories."
else
  USERDATA_DIR=$1
  DOWNLOAD_DIR=$2
fi

DISPLAY_CONF="-v /tmp/.X11-unix:/tmp/.X11-unix:rw -e DISPLAY=${DISPLAY}"

xhost +local:root
docker run --rm ${DISPLAY_CONF} -v ${USERDATA_DIR}:/root/baidunetdisk -v ${DOWNLOAD_DIR}:/root/baidunetdiskdownload dawnos/baidunetdisk
xhost -local:root 

