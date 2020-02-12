#!/usr/bin/env bash
arg=${1:-.}
exts="aux bbl blg brf fls fdb_latexmk idx ilg ind lof log lol lot out toc synctex.gz xml"

if [ -d $arg ]; then
    for ext in $exts; do
         rm -f $arg/*.$ext
    done
else
    for ext in $exts; do
         rm -f $arg.$ext
    done
fi

rm -rf _minted-main
