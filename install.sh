#!/bin/bash
echo "> linking configuration files by @vladdeSV"
echo
for file in .*; do
    if [ -f $file ]; then
        echo "> linking $file";
        if [ -f "${HOME}/$file" ]; then
            echo "!> conflicting $file found. ignoring..."
        else
            ln -s "$(pwd)/$file" "${HOME}/$file"
        fi
    fi
done

echo
echo "> done"
