#!/bin/ksh

if (( $# != 1 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

echo $(($1))
exit 0
