#!/bin/bash

sorc=${HOME}/.dotfiles/git
dest=`git rev-parse --show-toplevel`

if [[ "$dest" == "" ]]; then
    echo "CANCELLING .gitignore install"
elif [ -f "$dest/.gitignore" ]; then
    echo "CANCELLING: .gitignore already exists for git repo at $dest"
else
    echo "Adding boilerplate .gitignore to git repo at $dest"
    pushd $dest > /dev/null
    cp $sorc/.gitignore .
    git add .gitignore
    popd > /dev/null
fi
