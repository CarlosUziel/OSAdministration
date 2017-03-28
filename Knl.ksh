#!/bin/ksh

if (( $# == 0 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

typeset -i counter=1;

while (( $# != 0 ))
do
	if [[ ! -f $1 ]]
	then
		print -u2 "$1: not a regular file"
		continue
	fi

	exec 0<$1

	while read LINE
	do
		echo $counter $LINE
		counter+=1		
	done

	shift
	counter=1;
done

exit 0
