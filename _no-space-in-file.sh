#!/bin/bash

# This script checks names of the files in the target folder
# and replaces them with "_" (underscore) symbol.

# Input parameter to the script is a path to the target folder

SOURCE=$1
INITDIR=$PWD
FILE_LIST="/tmp/find_list"

if [[ ! -e "$SOURCE" ]]; # First check if the target does exist in the file system
then
	echo "Target does not exist."
	exit 1
fi

if [[ -d $SOURCE ]]; # Checking if target is a directory
then
	cd "$SOURCE"
	find . -maxdepth 1 -type f -name "*" -printf %f"\n" > "$FILE_LIST"
	while read -r FILE
	do
		if [[ ! -z $FILE ]]; then
			rename 's/ /_/g' "$FILE"
		fi
	done < "$FILE_LIST"
	rm "$FILE_LIST"
	cd "$INITDIR"
	exit 0
elif [[ ! -d $SOURCE ]]; 
then
	echo "Error! Please enter directory as input."
	exit 1
fi	
