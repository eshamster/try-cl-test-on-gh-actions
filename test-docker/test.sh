#!/bin/sh

set -eux

lisp=$1
ros use ${lisp}

dir=/root/.roswell/local-projects/target
cp -vR /github/workspace ${dir}
cd ${dir}
# - for test - #
pwd
ls
# ----- #
rove *.asd
