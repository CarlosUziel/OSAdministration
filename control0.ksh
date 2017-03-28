#!/bin/ksh

while (( $# != 0 ))
do
	echo $1
	ls -l $1 | cut -f1 -d" "
	shift
done

exit 0
