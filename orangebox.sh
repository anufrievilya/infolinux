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

case $OS in
	ubuntu)
		echo "UBUNTU!"
		;;
	centos)
		echo "centos"
		;;
	*)
		echo "help"
		;;
esac

check_distro(){
	if [[ -e /etc/redhat-release ]]
	then	
		DISTRO=$(cat /etc/redhat-release)
	elif [[ -e /etc/lsb_release ]]
	then
		DISTRO=$(lsb_release -d | awk -F ':' '{print $2}')
	fi

}
