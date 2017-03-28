#!/bin/ksh

if (( $# != 1))
then
	echo "Wrong invocation"
	exit 1
fi

	RES=$(lastlog -b $1 | tail -n+2 | cut -f1 -d" "| tr "\n" " ")

	for i in $RES
	do
		UID=$(grep ^$i: /etc/passwd | cut -f3 -d:)
		if (( $UID  > 499 ))
		then
			print $i
		fi
	done

exit 0
