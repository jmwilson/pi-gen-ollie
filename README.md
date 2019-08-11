# pi-gen-ollie

_Tool used to create Raspbian images for
[ollie](https://github.com/jmwilson/ollie)_

## Description

pi-gen-ollie is a fork of [pi-gen](https://github.com/RPi-Distro/pi-gen),
the tool used to create standard Raspbian images. pi-gen-ollie adds an
additional stage 6 to the build process to include the packages required for
Ollie and Snips.

Other changes from the standard image include:
- Mount `/tmp` and `/var/log` as `tmpfs` file systems for durability
against hard power-off events
- Set locale to `en-US` and use UTC as default timezone
- Remove startup wait on network initialization

Stage 6 depends on packages in the
[Ollie PPA](https://launchpad.net/~jmwilson/+archive/ubuntu/ollie)
hosted on Ubuntu Launchpad.

## Config

Upon execution, `build.sh` will source the file `config` in the current
working directory.  This bash shell fragment is intended to set needed
environment variables.

The standard `config` used for creating distributed images is

```
IMG_NAME=Ollie
STAGE_LIST="stage0 stage1 stage2 stage6"
```

See upstream [README](https://github.com/RPi-Distro/pi-gen) for more
information on other configuration options.
