#!/bin/ksh

# Displays command usage and options

printHelp () {
	print
	echo "Display the ten biggest files in the given directories (current directory by default)"
	echo "Usage: ./buscagordos [-n] [-h] [-p] [-r] [DIR]..."
	echo "-n, output the biggest n files."
	echo "-h, display sizes in human readable form" 
	echo "-p, display file's path only"
	echo "-r, display n files in ascending order"
	echo "IMPORTANT NOTE: All options must been set separately"
	print
}

# Check is help is requested

if [[ $1 == @(-help) ]]
then
	printHelp
	exit 0
fi

# Default options

typeset -i n=10
reverse="-r"
sortType="-n"

# Examines options

while [[ $1 == @(-*) ]]
do
	if [[ $1 == @(-+([0-9])) ]]
	then
		n=${1#-}
	elif [[ $1 == @(-h) ]]
	then
		humR="-h"
		sortType="-h"
	elif [[ $1 == @(-p) ]]
	then
		columns='$2'	
	elif [[ $1 == @(-r) ]]
	then
		reverse=""
	else
		print -u2 "Wrong option: $1"
		printHelp
		exit -1
	fi

	shift
done

# Collects all directories

while (( $# != 0 ))
do

	if [[ $1 == @(-*) ]]
	then
		print -u2 "Options must precede directories"
		printHelp
		exit -2
	elif [[ ! -d $1 ]]
	then
		print -u2 "$1 is not a valid directory"
		shift
		continue
	fi

	dir+=" $1"
	shift
done

# Find all the files in the given directories, cut the n biggest files.

find $dir -type f -exec du -B1 $humR {} \; | sort $sortType -r -k1 -t" " | head -n$n | sort $sortType $reverse -k1 -t" " | awk "{ print $columns }"

exit 0