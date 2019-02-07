#!/bin/sh

# This is script for the local generation of the PDF file
# You shall install pandoc and texlive packages to make it work

SOURCE_FILE_NAME="README"
DEST_FILE_NAME="pandoc-2-pdf-how-to"
YAML_FILE="_yaml-block.yaml"
TEMPLATE="eisvogel_mod"
DATE=$(date "+%d %B %Y")
# SOURCE_FORMAT="markdown_github+yaml_metadata_block+smart+implicit_figures"
SOURCE_FORMAT="markdown_github+yaml_metadata_block+implicit_figures"

pandoc -s -S -o "$DEST_FILE_NAME".pdf -f "$SOURCE_FORMAT" --template "$TEMPLATE" --toc --listings --number-section --dpi=300 -M date="$DATE" -V lang=en-US "$YAML_FILE" "$SOURCE_FILE_NAME".md >&1
# pandoc -s -o "$DEST_FILE_NAME".pdf -f "$SOURCE_FORMAT" --template "$TEMPLATE" --toc --listings ---number-sectio n-dpi=300 -M date="$DATE" -V lang=en-US "$YAML_FILE" "$SOURCE_FILE_NAME".md >&1
