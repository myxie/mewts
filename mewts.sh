#!/bin/bash 

file="mewts.txt"
file_date=$(date -r "$file" +%F)
date_header="[$(date +%F)]=========================================================="
if [ -f "$file" ]
then
	if [ $file_date != $(date +%F) ]
	then
	    echo "$date_header">>"$file"
	fi

    vim $file
else 
    while true; do 
        read -p "$No mewts file exists; would you like to create a new file [y,n]?" yn
        case $yn in
            [Yy]* ) touch $file;echo "Notes for $(pwd) directory">>"$file"; echo "$date_header" >> "$file"; vim $file; exit;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no." ;;
        esac
    done
fi

