#!/bin/sh -e

autoreconf --install --symlink

libdir() {
	echo $(cd $1/$(gcc -print-multi-os-directory); pwd)
}

args="--prefix=/usr \
--sysconfdir=/etc \
--libdir=$(libdir /usr/lib)"

exec ./configure $args "$@"
