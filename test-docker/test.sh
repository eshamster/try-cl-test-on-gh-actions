#!/bin/sh

set -eux

lisp=$1
install_targets="${2:-}"

if [ "${install_targets}" != "" ]; then
    echo "${install_targets}" | tr ',' '\n'| while read target; do
        ros install ${target}
    done
    ros -e '(ql:register-local-projects)' -q
fi

ros use ${lisp}

# Note: Assume that repository is checkout to workspace folder in previous step
dir=/root/.roswell/local-projects/target
cp -R /github/workspace ${dir}
cd ${dir}
rove *.asd 2>&1 | tee /tmp/test.log
# Note: In Clozure CL, terminating debug console finishes in errcode 0,
# so grep message to check if the test has actually run.
grep -E "tests? passed" /tmp/test.log
