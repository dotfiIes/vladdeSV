#!/bin/bash
echo "> linking configuration files by @vladdeSV"
echo
for file in .*; do
    if [ -f $file ]; then
        echo "> linking $file";
        if [ -f "${HOME}/$file" ]; then
            echo "!> conflicting $file found. renaming old file"
            mv "${HOME}/$file" "${HOME}/$file.old"
        fi
        
        ln -s "$(pwd)/$file" "${HOME}/$file"
    fi
done

echo
echo "> updating .bash_profile"
source ~/.bash_profile
echo "> done"
