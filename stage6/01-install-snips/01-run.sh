#!/bin/bash -e

install -m 644 files/assistant_proj_QPypyO6X1M.zip "${ROOTFS_DIR}/usr/share/snips"
on_chroot << EOF
unzip /usr/share/snips/assistant_proj_QPypyO6X1M.zip -d /usr/share/snips
rm -f /usr/share/snips/assistant_proj_QPypyO6X1M.zip
EOF
