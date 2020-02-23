#!/bin/sh

set -eux

lisp=$1
ros use ${lisp}

# Note: Assume that repository is checkout to home folder in previous step
cd ~
rove *.asd
