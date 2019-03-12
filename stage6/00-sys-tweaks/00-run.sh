#!/bin/bash -e

rm -f "${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/wait.conf"

install -m 644 files/ppa.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/snips.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/50-var.conf "${ROOTFS_DIR}/etc/tmpfiles.d/"

on_chroot apt-key add - < files/ppa.gpg.key
on_chroot apt-key add - < files/snips.gpg.key
on_chroot << EOF
apt-get update
EOF
