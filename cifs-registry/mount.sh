#!/bin/sh

print_usage() {
	echo "Usage:"
	echo "docker run -d --privileged -e SMB_HOST={hostname} -e SMB_USER={user} -e SMB_PASS={pass} devsli/cifs-registry"
}

error() {
	echo $2
	print_usage
	exit $1
}

if   [ "$SMB_HOST" = "" ]; then
	error 1, "Samba host not specified (-e SMB_HOST=nas.example.lan)";
elif [ "$SMB_USER" = "" ]; then
	error 2, "Username not specified (-e SMB_USER=Guest)";
fi

if [ "$SMB_ROOT" = "" ]; then
	echo "Using default SMB_ROOT=/"
	SMB_ROOT=/
fi

if [ "$MOUNT" = "" ]; then
	MOUNT=/tmp/registry
fi

if [ "$SMB_CHARSET" = "" ]; then
	SMB_CHARSET=utf8
fi

mkdir -p $MOUNT

mount.cifs //$SMB_HOST$SMB_ROOT $MOUNT -o user=$SMB_USER,pass=$SMB_PASS,iocharset=$SMB_CHARSET

docker-registry
