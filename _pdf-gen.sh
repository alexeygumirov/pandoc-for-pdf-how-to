#!/usr/bin/sh

# This is script for the local generation of the PDF file
# You shall install pandoc and texlive packages to make it work

SOURCE_FILE_NAME="README"
DEST_FILE_NAME="pandoc-2-pdf-how-to.pdf"
DEST_FILE_NAME_PROTECTED="pandoc-2-pdf-how-to_(protected).pdf"
INDEX_FILE="INDEX"
TEMPLATE="eisvogel_mod.latex"
DATE=$(date "+%d %B %Y")
DATA_DIR="pandoc"
PDF_ENGINE="lualatex"

SOURCE_FORMAT="markdown_strict\
+backtick_code_blocks\
+pipe_tables\
+auto_identifiers\
+yaml_metadata_block\
+implicit_figures\
+table_captions\
+footnotes\
+smart\
+escaped_line_breaks\
+header_attributes"

pandoc -s -o "$DEST_FILE_NAME" -f "$SOURCE_FORMAT" --data-dir="$DATA_DIR" --template "$TEMPLATE" --toc --listings --columns=50 --number-section --dpi=300 --pdf-engine "${PDF_ENGINE}" -M date="$DATE" $(cat "$INDEX_FILE") >&1

OWNER_PASSWORD=$(date | md5sum | cut -d ' ' -f 1)

qpdf --object-streams=disable --encrypt "" "$OWNER_PASSWORD" 256 --print=none --modify=none --extract=n -- "$DEST_FILE_NAME" "$DEST_FILE_NAME_PROTECTED"
