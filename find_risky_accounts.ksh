#!/bin/ksh

for i in $(cut -f1,3 -d: /etc/passwd | tr "\n" " ")
do
	UID=${i#*:}
	USR=${i%:*}

	if (( $UID <= 499))
	then
		continue
	fi

	SDW=$(grep $USR /etc/shadow | cut -f5,8 -d:)
	MPA=${SDW%:*}
	AED=${SDW#*:}

	if [[ $MPA == 99999 || ${#AED} == 0 ]]
	then
		print $USR >> /var/log/risky_accounts
	fi
done

exit 0
