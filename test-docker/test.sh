#!/bin/sh

set -eux

lisp=$1
ros use ${lisp}

find / -name "*.asd"
echo "--------------------"
find /github
echo "--------------------"
find /

dir=/root/.roswell/local-projects/target
ln -s ${HOME} ${dir}
cd ${dir}
rove *.asd
