#!/bin/bash

source_dir="/path/to/source/directory"
target_dir="/path/to/target/directory"

# Find all files in the source directory
source_files=$(find "$source_dir" -type f)

# Iterate over each file in the source directory
for file in $source_files; do
    # Get the inode number of the file
    inode=$(stat -c "%i" "$file")

    # Find all hardlinks of the file in the target directory
    hardlinks=$(find "$target_dir" -type f -inum "$inode" 2>/dev/null)

    # If hardlinks are found, print them
    if [ -n "$hardlinks" ]; then
        echo "Hardlinks of $file:"
        echo "$hardlinks"
        echo
    fi
done