#!/bin/bash
set -e

tempdir=/data/build
rm -rf /data/build && mkdir -p /data/build

bundle_array=($(ls /data/bundles))

for ((index=0; index<${#bundle_array[@]}; index++)); do
    pip wheel -r /data/bundles/${bundle_array[$index]}/requirements.txt --wheel-dir=$tempdir
    pip wheel -r /data/bundles/${bundle_array[$index]}/tests/requirements.txt --wheel-dir=$tempdir || true
done

pip wheel install -r /data/libs/sanji/requirements.txt --wheel-dir=$tempdir

echo "Build wheels done!"
