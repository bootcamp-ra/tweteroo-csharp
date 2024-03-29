#!/bin/bash

# Get the current commit SHA
current_sha=$(git rev-parse HEAD)
image_name="tweteroo-csharp"
sha_tag="$image_name:$current_sha"
latest_tag="$image_name:latest"

# Build the Docker image and tag it with the commit SHA
docker build -t $sha_tag -t $latest_tag .

# Save the Docker image to a tarball
mkdir -p $TMP_DIR

docker save -o $TMP_DIR/$image_name.tar $sha_tag
docker save -o $TMP_DIR/$image_name-latest.tar $latest_tag