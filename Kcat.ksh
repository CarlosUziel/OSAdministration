#!/bin/ksh

if (( $# == 0 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

while (( $# != 0 ))
do
	print $(<$1)
	shift
done

exit 0
