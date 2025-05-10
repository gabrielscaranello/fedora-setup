#! /bin/bash

PWD=$(pwd)
REPOS=$(tr '\n' ' ' <"${PWD}/unused_repos")

echo "Removing unused repos..."
sudo rm -rf "$REPOS"
echo "$REPOS" | xargs sudo rm -rf
echo "Unused repos removed."
