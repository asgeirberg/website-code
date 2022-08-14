#!/bin/bash

echo "Checking if hugo is installed..."

if ! command -v hugo &> /dev/null
then
    echo "hugo could not be found"
    exit
else 
   hugo
fi

git --git-dir=/Users/asgeir/Dropbox/Philosophy/website/public/.git --work-tree=/Users/asgeir/Dropbox/Philosophy/website/public/ add -A

if [ $# -eq 0 ]; then
    git --git-dir=/Users/asgeir/Dropbox/Philosophy/website/public/.git --work-tree=/Users/asgeir/Dropbox/Philosophy/website/public/ commit -m "$1"
else
   git --git-dir=/Users/asgeir/Dropbox/Philosophy/website/public/.git --work-tree=/Users/asgeir/Dropbox/Philosophy/website/public/ commit -m "Updated website"
fi

git --git-dir=/Users/asgeir/Dropbox/Philosophy/website/public/.git --work-tree=/Users/asgeir/Dropbox/Philosophy/website/public/ push -u origin master
