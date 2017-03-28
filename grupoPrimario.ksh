#!/bin/ksh

exec 0</etc/passwd

IFS=:

while read acc pw uid gid gecos dir s
do
	if [[ -z $(cut -f3 -d: /etc/group | grep ^$gid$) ]]
	then
		echo "Usuario: $acc | UID: $uid | GID: $gid"
	fi
done

exit 0
