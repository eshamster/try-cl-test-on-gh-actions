#!/bin/sh

set -eux

lisp=$1
ros use ${lisp}

# Note: Assume that repository is checkout to workspace folder in previous step
cd /github/workspace
rove *.asd
