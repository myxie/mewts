path=$PWD
user_dir='/home/croutons/'
dropbox_dir='/home/croutons/Dropbox/mewts'
link_dir="${path//$user_dir/}";
link_file_name="${link_dir//'/'/'-'}.txt"
dropbox_link="$dropbox_dir/$link_file_name"

echo $dropbox_link

file="${path}/mewts.txt"

ln -s $file $dropbox_link
