#!/bin/bash -e

install -m 644 files/snips.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/50-var.conf "${ROOTFS_DIR}/etc/tmpfiles.d/"
install -m 644 files/99-usbtmc.rules "${ROOTFS_DIR}/etc/udev/rules.d/"

on_chroot apt-key add - < files/snips.gpg.key
on_chroot << EOF
apt-get update
addgroup usbtmc
adduser ${FIRST_USER_NAME} usbtmc
EOF
