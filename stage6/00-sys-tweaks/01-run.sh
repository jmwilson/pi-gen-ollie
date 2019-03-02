#!/bin/bash -e

install -m 644 files/snips.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/50-var.conf "${ROOTFS_DIR}/etc/tmpfiles.d/"
install -m 644 files/99-usbtmc.rules "${ROOTFS_DIR}/etc/udev/rules.d/"

install -d "${ROOTFS_DIR}/var/cache/apt/archives"
install -m 644 files/seeed-voicecard_0.3+git20190227-1_all.deb "${ROOTFS_DIR}/var/cache/apt/archives"
install -m 644 files/seeed-voicecard-dkms_0.3+git20190227-1_armhf.deb "${ROOTFS_DIR}/var/cache/apt/archives"

on_chroot apt-key add - < files/snips.gpg.key
on_chroot << EOF
apt-get update
groupadd -f usbtmc
adduser ${FIRST_USER_NAME} usbtmc
dpkg --install /var/cache/apt/archives/seeed-voicecard_0.3+git20190227-1_all.deb
dpkg --install /var/cache/apt/archives/seeed-voicecard-dkms_0.3+git20190227-1_armhf.deb
EOF
