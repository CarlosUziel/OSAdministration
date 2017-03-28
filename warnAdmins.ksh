#!/bin/ksh

exec 0</etc/gshadow

IFS=:

while read a b c d
do
	if [[ $b = '!' || $b = '!!' ]]
	then
		continue
	fi

	ADMIN_LIST=$(echo $c | tr "," " ")
	# extraer cada uno de los admins
	for admin in $ADMIN_LIST
	do
		EMAIL=$(cat /etc/shadow | grep $admin | cut -f9 -d:)
		# sending an email format: email "email" "subject" "content"
		email $EMAIL "Put a password to your group $a" "As an admin of the group $a, you should configure a password"
	done
	
	# get email of each admin
	# send email asking to put a password
done
