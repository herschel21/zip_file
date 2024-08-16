#!/bin/bash

for file in *.zip; do 
    dir="${file%.*}"
    mkdir "$dir"
    unzip "$file" -d "$dir"
done
