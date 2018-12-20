#!/bin/sh

SOURCE_FILE_NAME="README"
DEST_FILE_NAME="pandoc-2-pdf-how-to"
YAML_FILE="_yaml-block.yaml"
TEMPLATE="eisvogel_mod"
DATE=$(date "+%d %B %Y")

pandoc -s -S -o $DEST_FILE_NAME.pdf --template $TEMPLATE --toc --listings --dpi=300 -M date="$DATE" -V lang=en-US $YAML_FILE $SOURCE_FILE_NAME.md >&1
