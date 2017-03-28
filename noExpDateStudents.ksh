#!/bin/ksh

students=$(lid -g alumnos | tr -d " " | cut -f1 -d"(")

for student in $students
do
	if [[ -z $(grep ^$student: /etc/shadow | cut -f8 -d:) ]]
	then
		print $student >> /var/log/alumnos_sin_caducidad
	fi
done

exit 0
