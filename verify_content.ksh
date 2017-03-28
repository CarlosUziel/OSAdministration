#!/bin/ksh

if (( $# != 2 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

exec 0<$1

while read LINE
do
	file_name=$(echo $LINE | cut -f1 -d:)
	file_cksum=$(echo $LINE | cut -f2 -d:)
	file_perm=$(echo $LINE | cut -f3 -d:)

	if [[ $(cksum $file_name) != $file_cksum  || $(ls -l $file_name | cut -f1 -d" ") != $file_perm ]]
	then
		print $file_name >> $2
	fi
done


exit 0
