#!/bin/ksh

users=$(lastlog -b 15 | tail -n+2 | cut -f1 -d" ")

for usr in $users
do
	if [[ $(groups $usr | grep alumnos) ]]
	then
		echo $usr
		print $usr >> /var/log/alumnos_sin_login
	fi
done

exit 0
