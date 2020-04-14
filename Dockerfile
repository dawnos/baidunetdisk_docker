FROM ubuntu:bionic

RUN apt update
RUN apt install -y libnss3 libgtk-3-0 libx11-xcb1 libxss1 libasound2 desktop-file-utils
RUN apt install -y fonts-droid-fallback
RUN apt clean && rm -rf /var/lib/apt/lists/*

COPY baidunetdisk_linux_*.deb /tmp
RUN dpkg -i /tmp/baidunetdisk_linux_*.deb

COPY baidunetdisk_entrypoint.sh /
ENTRYPOINT ["/baidunetdisk_entrypoint.sh"]

