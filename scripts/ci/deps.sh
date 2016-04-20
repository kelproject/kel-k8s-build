#!/bin/bash
set -e

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

git clone --branch ${BUILD_TAG%_*} https://github.com/kubernetes/kubernetes.git
