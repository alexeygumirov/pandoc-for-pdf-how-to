#!/bin/bash
#
# This script checks names of the files in the target folder
# and replaces them with "_" (underscore) symbol.

# Input parameter to the script is a path to directory

SOURCE=$1
INITDIR=$PWD

if [ ! -e "$SOURCE" ] ;
then
	echo "Target does not exist"
	exit 1
fi

if [ -d $SOURCE ]; then
	cd $SOURCE
	for file in *
	do
		rename 's/ /_/g' "$file"
	done
	cd $INITDIR	
	exit 0
elif [ ! -d $SOURCE ]; then
	echo "Error! Please enter directory as input."
	exit 1
fi