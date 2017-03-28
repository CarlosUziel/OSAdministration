#!/bin/ksh

if (( $# != 2 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

typeset -i cnt

for i in $(cut -f1,3 -d: /etc/passwd)
do
	cnt=0
	USR=${i%:*}
	UID=${i#*:}

	if (( $UID  < 500 ))
	then
		continue
	fi

	exec 0</var/log/secure

	while read LINE
	do
		if [[ $LINE == @(*FAILED LOGIN*FROM*FOR $USR*) ]]
		then
			cnt+=1
		fi
	done

	if (( $cnt > $1 ))
	then
		print $USR >> $2
	fi
done

exit 0



