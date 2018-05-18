#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

apt-get -yq install qemu qemu-user-static binfmt-support parted wget dosfstools zip
