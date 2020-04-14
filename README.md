# Baidu NetDisk Docker

## Usage

Try with the following command:
```bash
docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix:rw -e DISPLAY=${DISPLAY} -v /dir/to/user/data:/root/baidunetdisk -v /dir/to/download/data:/root/baidunetdiskdownload dawnos/baidunetdisk
```

Please replace the paths `/dir/to/user/data` and `/dir/to/download/data` to the paths you want to store your user data and downloaded files. An example is
```bash
docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix:rw -e DISPLAY=${DISPLAY} -v ${HOME}/baidunetdisk:/root/baidunetdisk -v ${HOME}/baidunetdiskdownload:/root/baidunetdiskdownload dawnos/baidunetdisk
```
