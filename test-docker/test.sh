#!/bin/sh

# set -eux
set -ux

lisp=$1
ros use ${lisp}

# Note: Assume that repository is checkout to workspace folder in previous step
dir=/root/.roswell/local-projects/target
ln -s /github/workspace ${dir}
cd ${dir}
rove *.asd
