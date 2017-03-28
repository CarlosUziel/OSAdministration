#!/bin/ksh

if (( $#!=1 ))
then
	print -u2 "Wrong invocation"
	exit -1
fi

BLOCKS_PERCENT=$(df -h | grep /$ | tr -s " " | cut -f5 -d" ")
BLOCKS_PERCENT=${BLOCKS_PERCENT%%%}

if (( $((100-$BLOCKS_PERCENT)) < $1 ))
then
	print "There is less than $1% blocks available"
fi

INODES_PERCENT=$(df -i | grep /$ | tr -s " " | cut -f5 -d" ")
INODES_PERCENT=${INODES_PERCENT%%%}

if (( $((100-$INODES_PERCENT)) < $1 ))
then
        print "There is less than $1% inodes available"
fi

exit 0
