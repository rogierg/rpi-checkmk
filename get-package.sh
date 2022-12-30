#!/bin/bash
ARCH=$(dpkg --print-architecture)
CODENAME=$(env -i bash -c '. /etc/os-release; echo $VERSION_CODENAME')

if [ "$ARCH" == "arm64" ] || [ "$ARCH" == "aarch64" ];
then
    echo "arm64 detected downloading package."
    curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep ${CODENAME}_${ARCH}.deb)
elif [ "$ARCH" == "armv7" ] || [ "$ARCH" == "armhf" ];
then
    echo "armhf/armv7 detected downloading package"
    #Technically having it search via codename is pointless for 32 bit as the upstream only has 'bullseye_armhf'
    #later down the road this script may need to deal with starting the install as well.
    curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep ${CODENAME}_armhf.deb)
else
    echo "Package not found for the architecture: $ARCH"
fi
