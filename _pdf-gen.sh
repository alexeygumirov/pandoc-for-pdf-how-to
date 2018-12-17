#!/bin/sh

SOURCE_FILE_NAME="README"
DEST_FILE_NAME="pandoc-2-pdf-how-to"
YAML_FILE="_yaml-block.md"
TEMPLATE="eisvogel"
 
pandoc -s -S -o $DEST_FILE_NAME.pdf --template $TEMPLATE --toc --listings --dpi=300 -V lang=en-US $YAML_FILE $SOURCE_FILE_NAME.md >&1
