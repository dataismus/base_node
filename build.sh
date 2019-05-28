#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo 'Please specify an app and version/tag'
    exit 1
fi
image=$1
version=$2

echo "image : ${image}, tag : ${version} "
chmod +x *.sh
docker build -f ${image}.Dockerfile -t dataismus/${image}:${version} . && \
docker push dataismus/${image}:${version}
git add --all && git commit -m "autobuild" && git push