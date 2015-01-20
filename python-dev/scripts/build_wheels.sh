#!/bin/bash
set -e

mkdir -p /data/build

tempdir=/data/build

# Install all deps via pip install requirements.txt (/ and /tests/)
bundle_array=($(ls /data/bundles))

for ((index=0; index<${#bundle_array[@]}; index++)); do
    pip install -r /data/bundles/${bundle_array[$index]}/requirements.txt
    pip install -r /data/bundles/${bundle_array[$index]}/tests/requirements.txt || true
done

pip install -r /data/libs/sanji/requirements.txt

# packing all packages into whl
pip wheel `pip freeze` --wheel-dir=$tempdir

echo "Build wheels done!"
