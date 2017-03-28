#!/bin/ksh

if (( $# != 1 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

if [[ ! -f $1 ]]
then
	print -u2 "Parameter must be a regular file"
	exit 2
fi

exec 0<$1

while read LINE
do
	print "Nombre: "$(echo $LINE | cut -f1 -d:)
	print "Apellidos: "$(echo $LINE | cut -f2 -d:)
	print "DNI: "$(echo $LINE | cut -f3 -d:)
	print "Número de expediente: "$(echo $LINE | cut -f4 -d:)
	print "Titulación: "$(echo $LINE | cut -f5 -d:)
done

exit 0
