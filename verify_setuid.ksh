#!/bin/ksh

if (( $# != 2 ))
then
	print "Wrong invocation"
	exit 1
fi

RES=$(find . -perm /4000)

for i in $RES
do
	exec 0<$1
	while read LINE
	do
		if [[ $LINE = $i ]]
		then
			continue 2
		fi
	done

	echo $i >> $2

done

exit 0

# To add SUID to a file -> chmod u+s file
# To add GUID to a file -> chmod g+s file	
