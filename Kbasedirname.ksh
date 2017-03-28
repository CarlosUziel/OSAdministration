#!/bin/ksh

if (( $# != 2 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

if [[ $1 = "-d" ]]
then
	echo ${2%/*}
elif [[ $1 = "-f" ]]
then
	echo ${2##*/}
elif [[ $1 = "-a" ]]
then
	echo ${2##*/}
	echo ${2%/*}
else
	print -u2 "Wrong option"
	exit 2
fi

exit 0
