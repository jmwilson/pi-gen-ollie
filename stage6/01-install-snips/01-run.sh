#!/bin/bash -e

unzip files/assistant_proj_QPypyO6X1M.zip -d "${ROOTFS_DIR}/usr/share/snips"
install -m 644 files/ollie_1.0_all.deb "${ROOTFS_DIR}/var/cache/apt/archives"
install -m 644 files/python3-paho-mqtt_1.4.0-1_all.deb "${ROOTFS_DIR}/var/cache/apt/archives"
install -m 644 files/python3-usbtmc_0.8-1_all.deb "${ROOTFS_DIR}/var/cache/apt/archives"
install -m 644 files/python3-usb_1.0.2-1_all.deb "${ROOTFS_DIR}/var/cache/apt/archives"

on_chroot << EOF
dpkg --install /var/cache/apt/archives/ollie_1.0_all.deb \
  /var/cache/apt/archives/python3-paho-mqtt_1.4.0-1_all.deb \
  /var/cache/apt/archives/python3-usbtmc_0.8-1_all.deb \
  /var/cache/apt/archives/python3-usb_1.0.2-1_all.deb
EOF
