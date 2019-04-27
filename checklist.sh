#!/bin/bash

checklist="checklist.html"

while IFS='' read -r line || [[ -n "$line" ]]; do
	echo "<input type="checkbox">$line <br>" >>$checklist
done < "$1"
