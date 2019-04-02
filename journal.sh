#!/bin/bash 
month=`date +%B`
year=`date +%Y`

cd $JOURNAL_DIR

if [ -d "$year" ]
then
	echo $year
else
	mkdir $year
fi

if [ -d "$year/$month" ]
then
	echo $year/$month
else
	mkdir $year/$month
fi

final_doc='journal.tex'
rm $final_doc

section_header=`date '+%A %d %B, %Y'`
full_date=`date +%Y-%m-%d`
journal_entry_file="$year/$month/$full_date.tex" 
if [ -f "$journal_entry_file" ]
then
	echo "file does exists"
	echo "$journal_entry_file"	
	subl $journal_entry_file;
else
	echo "file does not exist";
	echo "\documentclass[../../$final_doc]{subfiles}


	\section{$section_header}" >> $journal_entry_file;
	subl $journal_entry_file;
fi

read


echo "\documentclass[a4paper,11pt]{article} 
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[margin=2cm]{geometry}
\usepackage{cite}
\usepackage{tikz}
\usepackage{subcaption}
\usetikzlibrary{arrows.meta,angles,quotes}
\usetikzlibrary {positioning}
\tikzstyle{line} = [draw, -latex']

\usepackage{multicol}
\usepackage[font={footnotesize}]{caption}
\usepackage{forest}
\usepackage{graphicx}
\usepackage{pgfplots} \pgfplotsset{width=7cm,compat=1.9} 
\usepackage{hyperref}
\usepackage{color,soul}
\usepackage{amsmath} 
\usepackage{acronym}
\usepackage{subcaption}
\usepackage{pgfgantt}
\usepackage{ctable}
\usepackage{ragged2e} % provides \RaggedLeft \usepackage{amssymb}
\usepackage{xcolor}
\usepackage{subfiles}

\usepackage{titlesec}

\title{\textbf{Journal}}
\begin{document}
\maketitle

\titleformat{\section}{\normalfont\fontsize{11}{11}\bfseries}{\thesection}{0.5em}{}
" >> "$final_doc"

find . -mindepth 2 -name "*.tex" | sort -nr | while read i; do
	filename="${i//.\//}"; 
	echo "\subfile{$filename}" >>"$final_doc"

done

echo "\end{document}">>"$final_doc"




: ' 
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
' 
