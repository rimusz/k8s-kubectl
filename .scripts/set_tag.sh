#!/bin/bash

set -eo pipefail

# import TAG
source TAG

#
echo "--- Update Dockerfile with the tags"

# check OS version
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]]
then
  sed -i "" 's/\(KUBE_LATEST_VERSION \)\(.*\)/\1'${K8S_TAG}'/g' Dockerfile
else
  sed -i 's/\(KUBE_LATEST_VERSION \)\(.*\)/\1'${K8S_TAG}'/g' Dockerfile
fi

#
echo "--- Done"
