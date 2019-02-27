#!/bin/bash

S_VERSION=1.12.3

set -e

if [ -z "${S_VERSION}" ] ; then
  echo "SPINNAKER_VERSION not set"
  exit
fi

sudo hal config version edit --version $S_VERSION

sudo hal deploy apply