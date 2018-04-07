#!/usr/bin/env bash
set -e

if [ "$EUID" -ne 0 ]; then
    echo "This script uses functionality which requires root privileges"
    exit 1
fi


# base image 
acbuild --debug begin docker://node:alpine

# In the event of the script exiting, end the build
trap "{ export EXT=$?; acbuild --debug end && exit $EXT; }" EXIT


# Make the container's entrypoint 
acbuild set-exec -- ember
acbuild set-working-directory /app

# Build workspace
acbuild --debug run -- npm install -g ember-cli@3.0


# Write the result
acbuild --debug set-name emb
acbuild --debug label add version 0.0.1
acbuild --debug write --overwrite emb-0.0.1-linux-amd64.aci

#### Example command line params
#### sudo rkt run --insecure-options=image --volume data,kind=host,source=$(pwd)/test ./emb-0.0.1-linux-amd64.aci --net=host --mount volume=data,target=/app -- new tutorial-quickstart
#### sudo rkt run --insecure-options=image --volume data,kind=host,source=$(pwd)/test emb --net=host --mount volume=data,target=/app --working-dir=/app/tutor-quickstart -- serve
