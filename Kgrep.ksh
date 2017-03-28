!#/bin/ksh

if (( $# < 2 ))
then
	print -u2 "Wrong invocation"
	exit 1
fi

typeset -i c_flag=0
typeset -i i_flag=0

if [[ $1 = - ]]
then
fi
