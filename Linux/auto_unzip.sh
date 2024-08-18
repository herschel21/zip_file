#!/bin/bash

# Create a base directory for all extracted files
base_dir="extracted_files"
mkdir -p "$base_dir"

# Process each file
for file in *; do
    if [ -f "$file" ]; then
        # Create a subdirectory within the base directory for each file
        dir="$base_dir/${file%.*}"
        mkdir -p "$dir"

        case "$file" in
            *.zip) 
                unzip "$file" -d "$dir"
                ;;
            *.tar) 
                tar -xf "$file" -C "$dir"
                ;;
            *.gz) 
                # If it's a .tar.gz file
                gunzip -c "$file" | tar -x -C "$dir"
                ;;
            *.bz2) 
                # If it's a .tar.bz2 file
                bunzip2 -c "$file" | tar -x -C "$dir"
                ;;
            *.xz) 
                # If it's a .tar.xz file
                unxz -c "$file" | tar -x -C "$dir"
                ;;
            *.7z) 
                7z x "$file" -o"$dir"
                ;;
            *) 
                echo "Unsupported file type: $file"
                ;;
        esac
    fi
done

