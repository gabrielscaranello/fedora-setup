#! /bin/bash

PWD=$(pwd)
REPOS=$(cat "$PWD/unused_repos" | tr '\n' ' ')

echo "Removing unused repos..."
sudo rm -rf $REPOS
echo "Unused repos removed."
