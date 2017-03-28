#!/bin/ksh

if (( $# < 1 || $# > 2 ))
then
	print -u2 "Wrong Invocation"
	exit 1
fi

DIC=${2:-"/usr/dict/dictionary"}

exec 0<$DIC

while read WORD
do
	if [[ $1 = WORD ]]
	then
		print "$1 encontrada"
		exit 0
	fi
done

print "$1 no encontrada"
exit 0
