#!/usr/bin/env bash

# List all required docker images used by ddev
ddev version | awk '/(drud|phpmyadmin)/ {print $2;}' > /tmp/images.txt

# Pull docker images
while IFS= read -r image
do
  docker pull "$image"
done < /tmp/images.txt