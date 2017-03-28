#!/bin/ksh

if (( $# == 0 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

typeset -i cnt

while (( $# != 0 ))
do
	if [[ ! -f $1 ]]
	then
		print -u2 "$1 no es un fichero válido"
		continue
	fi

	exec 0<$1
	cnt=0

	while read LINE
	do
		echo "$LINE" >$1.$cnt
		cnt+=1	
	done

	shift
done
