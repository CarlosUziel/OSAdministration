#!/bin/ksh

# Check number of arguments

if (( $# < 1 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

# Process every file

while (( $# != 0 ))
do	

	var=$(find /home -uid +500 -name $1 -print -quit)
	if [[ -n $var ]]
	then
		echo "$1 found in $var"
	fi
	shift
done

exit 0
