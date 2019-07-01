#!/bin/bash

set -euxo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${BASEDIR}"
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends apt-utils
DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends build-essential
DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends \
  python python-pip python-dev \
  python3 python3-pip python3-dev
python2.7 -m pip install --upgrade pip setuptools
python3.6 -m pip install --upgrade pip setuptools
python2.7 -m pip install pytest pytest-cov
python2.7 -m pip install -e .
python3.6 -m pip install pytest pytest-cov
python3.6 -m pip install -e .
