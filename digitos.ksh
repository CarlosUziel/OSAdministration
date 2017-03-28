#!/bin/ksh

# Check arguments

if (( $# != 1 ))
then
	print -u2 "Wrong invocation"
	exit -1
fi

# Check # of digits in $1

if [[ $1 = !(*[0-9]*)[0-9]!(*[0-9]*) ]]
then
	print "La variable contiene un dígito"
elif [[ $1 = !(*[0-9]*)[0-9]!(*[0-9]*)[0-9]!(*[0-9]*) ]]
then
	print "La variable contiene dos dígitos"
else
	print "La variable tiene 0 dígitos o más de 2"
fi

exit 0
