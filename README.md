# Baidu NetDisk Docker

## Introduction
Baidu has provide a NetDisk client for Linux (https://pan.baidu.com/download#pan). However, it only works on ubuntu 18.04 or newer. To get it work on 16.04 or older, this repo share a docker image. Additionally, the UI is based on VNC (noVNC), so you can access it through any VNC client or browser.

## Usage

Try with the following command:
```bash
docker run -p 5901:5901 -p 6080:6080 /dir/to/user/data:/root/baidunetdisk -v /dir/to/download/data:/root/baidunetdiskdownload dawnos/baidunetdisk
```

Please replace the paths `/dir/to/user/data` and `/dir/to/download/data` to the paths you want to store your user data and downloaded files. An example is
```bash
docker run -p 5901:5901 -p 6080:6080 -v ${HOME}/baidunetdisk:/root/baidunetdisk -v ${HOME}/baidunetdiskdownload:/root/baidunetdiskdownload dawnos/baidunetdisk
```

Then you can access Baidu Netdisk through:
- VNC client on `localhost:5901`, or
- http://localhost:6080 in browser.
