#!/usr/bin/env bash

BASEDIR="$(pwd -P)"
echo "Current directory:" "$BASEDIR"

echo "Adding repositories"
while read repo; do

	if [[ $repo == *"#"* ]]
	then
		cd $BASEDIR
	  	dir="${repo//[$'\t\r\n# ']}"
		mkdir -p $dir;
		cd $dir;
	else
		git clone $repo;
	fi

	echo " -- "

done < $1
