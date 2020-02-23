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

ros run -e '(ql:register-local-projects)' -q
rove *.asd

cd
rm -rf ${dir}
cp -R /github/workspace ${dir}
cd ${dir}
rove *.asd

ros run -e '(ql:register-local-projects)' -q
rove *.asd
