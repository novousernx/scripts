#!/bin/bash

chars=( {a..z} {A..Z} {0..9} )

function rand_string {
    local c=$1 ret=
    while((c--)); do
        ret+=${chars[$((RANDOM%${#chars[@]}))]}
    done
    printf '%s\n' "$ret"
}

for file in ~/Downloads/hd/*
do
    ext=$(echo ${file} | sed 's,^.*\(\.[^\.]*$\),\1,')
    mv "$file" ~/Downloads/hd/"$(rand_string 10)"${ext}
done
