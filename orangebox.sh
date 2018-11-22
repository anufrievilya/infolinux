#!/bin/bash
echo "test orangebox.sh"
#hostname  >> all.info
OS=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
echo $OS

ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
echo $ARCH

RELEASE=$(awk '/DISTRIB_RELEASE=/' /etc/*-release | sed 's/DISTRIB_RELEASE=//' | sed 's/[.]0/./')
echo $RELEASE

if [ -z "$OS" ]; then
	OS=$(awk '{print $1}' /etc/*-release | tr '[:upper:]' '[:lower:]')
fi

if [ -z "$VERSION" ]; then
	VERSION=$(awk '{print $3}' /etc/*-release)
fi

echo $OS
echo $ARCH
echo $VERSION
