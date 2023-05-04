#!/bin/bash
FILES=(LICENSE README.md)
DES=./addons/compass/

for FILE in "${FILES[@]}"
do
	if [ -f $FILE ]
	then
		cp $FILE $DES
		echo "Copied $FILE to destination $DES"
	fi
done
