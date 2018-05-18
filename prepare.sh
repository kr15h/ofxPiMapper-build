#!/bin/bash

WD=$(pwd)
BUILD_DIR="${WD}/build"
RPI_VER="raspbian_lite-2018-04-19"
RPI_ZIP="2018-04-18-raspbian-stretch-lite.zip"
RPI_URL="http://downloads.raspberrypi.org/raspbian_lite/images/${RPI_VER}/${RPI_ZIP}"
RPI_SHA="b324cd7f3015e704543e4710ceecfb4881b77664  2018-04-18-raspbian-stretch-lite.zip"

# If file exists, check if the download is complete by checking the SHA1.
# Remove file if the download appears incomplete.

if [ -a "${RPI_ZIP}" ]; then
  DLD_SHA="$(shasum ${RPI_ZIP})"
  echo "Comparing SHA's"
  echo "RPI_SHA: ${RPI_SHA}"
  echo "DLD_SHA: ${DLD_SHA}"

  if [ "${DLD_SHA}" != "${RPI_SHA}" ]; then
    rm "${RPI_ZIP}"
  fi
fi

if [ -a "${RPI_ZIP}" ]; then
  echo "${RPI_ZIP} exists."
else
  echo "${RPI_ZIP} does not exist."
  wget --progress=bar:force "${RPI_URL}"
fi
