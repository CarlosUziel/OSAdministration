#!/bin/ksh

# Check number of arguments

if (( $# != 2 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

# Check second argument is a regular file

if [[ ! -f $2 ]]
then
	print -u2 "Second argument must be a regular file"
	exit 2
fi

# Creates group, if it is already created, nothing happens

groupadd $1 2>/dev/null

# Creates each new user

exec 0<$2

while read newUser
do
	useradd -G alumnos,$1 $newUser
done

exit 0
