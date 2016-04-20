#!/bin/bash
set -e

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

gsutil cp _output/local/go/bin/kubelet gs://release.kelproject.com/binaries/kubernetes/$BUILD_TAG/kubelet
gsutil cp _output/local/go/bin/hyperkube gs://release.kelproject.com/binaries/kubernetes/$BUILD_TAG/hyperkube
