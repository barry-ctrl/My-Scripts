#!/bin/bash
# wrapper script for preview searching files using fzf
# fzf program is a prerequisite for this
# sudo apt install fzf

if [ $# -eq 0 ]; then
	fzf --reverse --preview "cat {}"
	exit 1
elif [ $# -eq 1 ]; then
	dir_path=$1
	if [ -d "$dir_path" ]; then
		fzf --reverse --walker-root=$dir_path --preview "cat {}"
		exit 1
	else
		echo "Invalid Directory!!"
		exit 1
	fi
fi
