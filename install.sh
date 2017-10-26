#!/bin/bash
echo "> started"
echo
for file in .*; do
    if [ -f $file ]; then
	    echo "> moving $file";

        if [ -f "${HOME}/$file" ]; then
            echo " > conflicting $file found. renaming old file"
            mv "${HOME}/$file" "${HOME}/$file.old"
        fi

        cp $file "${HOME}/$file"
    fi
done

echo
echo "> running .bash_profile"
source ~/.bash_profile
echo
echo "> done"
