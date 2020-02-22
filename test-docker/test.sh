#!/bin/sh

set -eux

lisp=$1
ros use ${lisp}

cd ~/.roswell/local-projects/target
rove *.asd
