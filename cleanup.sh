#!/bin/bash

# Loop through all directories except .git
for dir in */; do
    if [ "$dir" != ".git/" ]; then
        # Remove src/ and pkg/ folders if they exist
        if [ -d "${dir}src" ]; then
            echo "Removing ${dir}src"
            rm -rf "${dir}src"
        fi
        if [ -d "${dir}pkg" ]; then
            echo "Removing ${dir}pkg"
            rm -rf "${dir}pkg"
        fi
        
        # Remove tar.zst files if they exist
        find "${dir}" -type f -name '*.tar.zst' -exec echo "Removing {}" \; -exec rm {} \;
    fi
done

