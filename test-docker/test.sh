#!/bin/sh

set -eux

lisp=$1
ros use ${lisp}

# Note: Assume that repository is checkout to workspace folder in previous step
dir=/root/.roswell/local-projects/target
cp -R /github/workspace ${dir}
cd ${dir}
rove *.asd 2>&1 | tee /tmp/test.log
# Note: In Clozure CL, terminating debug console finishes in errcode 0,
# so grep message to check if the test has run.
grep "test passed" /tmp/test.log
