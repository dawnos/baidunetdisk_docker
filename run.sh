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

docker run --rm ${DISPLAY_CONF} -p 5901:5901 -p 6080:6080 -v ${USERDATA_DIR}:/root/baidunetdisk -v ${DOWNLOAD_DIR}:/root/baidunetdiskdownload dawnos/baidunetdisk

