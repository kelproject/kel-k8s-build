#!/bin/bash
set -e

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

cd kubernetes
make all WHAT="cmd/kubelet cmd/hyperkube cmd/kubectl"

cd ../hyperkube
cp ../kubernetes/_output/local/go/bin/hyperkube .
sed -i "s/VERSION/${BUILD_TAG}/g" master.yml
docker build -t quay.io/kelproject/hyperkube:${BUILD_TAG} .
