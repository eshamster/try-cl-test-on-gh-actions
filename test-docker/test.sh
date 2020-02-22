#!/bin/sh

set -eux

lisp=$1
ros use ${lisp}

dir=~/.roswell/local-projects/target
ln -s /github/workspace ${dir}
cd ${dir}
rove *.asd
