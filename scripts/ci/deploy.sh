#!/bin/bash
set -e

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

gsutil cp kubernetes/_output/local/go/bin/kubelet gs://release.kelproject.com/binaries/kubernetes/$BUILD_TAG/kubelet
gsutil cp kubernetes/_output/local/go/bin/hyperkube gs://release.kelproject.com/binaries/kubernetes/$BUILD_TAG/hyperkube
gsutil cp kubernetes/_output/local/go/bin/kubectl gs://release.kelproject.com/binaries/kubernetes/$BUILD_TAG/kubectl

docker login -e noemail -u $QUAY_USERNAME -p $QUAY_PASSWORD quay.io
docker tag -f quay.io/kelproject/hyperkube:${BUILD_TAG} quay.io/kelproject/hyperkube:latest
docker push quay.io/kelproject/hyperkube:${BUILD_TAG}
docker push quay.io/kelproject/hyperkube:latest
