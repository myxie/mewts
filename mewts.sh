#!/bin/bash 
curr_path=$PWD
echo $path
user_dir='/home/croutons/'
dropbox_dir='/home/croutons/Dropbox/mewts'
link_dir="${curr_path//$user_dir/}";
link_file_name="${link_dir//'/'/'-'}.txt"
dropbox_link="$dropbox_dir/$link_file_name"
file="mewts.txt"

if [ -f "$file" ] 
then
    file_date=$(date -r "$file" +%F)
fi
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

echo $dropbox_link
logical_file="${curr_path}/mewts.txt"
echo $logical_file
if [ ! -f $logical_file ] 
then 
    ln -s $logical_file $dropbox_link
fi
