FROM ubuntu:bionic

RUN apt update && \
    apt install -y libnss3 libgtk-3-0 libx11-xcb1 libxss1 libasound2 desktop-file-utils && \
    apt install -y fonts-droid-fallback && \
    apt clean && rm -rf /var/lib/apt/lists/*

# COPY baidunetdisk_linux_*.deb /tmp
ARG DEB_URL="http://wppkg.baidupcs.com/issue/netdisk/LinuxGuanjia/3.0.1/baidunetdisk_linux_3.0.1.2.deb"
RUN apt update && apt install -y  wget && \
    cd /tmp && wget $DEB_URL && dpkg -i baidunetdisk_linux_*.deb && rm baidunetdisk_linux_**.deb && \
    apt remove -y wget && apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists/*


COPY baidunetdisk_entrypoint.sh /
ENTRYPOINT ["/baidunetdisk_entrypoint.sh"]

