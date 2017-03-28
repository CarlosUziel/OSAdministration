#!/bin/ksh

# Copia de /etc y /home

# Check if a destination has been specified

if (( $# == 1))
then
	DEST=$1
elif (( $# == 0 ))
then
	DEST="/backups"
else
	print -u2 "Wrong invocation"
fi

# Check if dir already exists

if [[ ! -d $DEST]]
then
	mkdir $DEST
fi

cd $DEST

DAY=$(date +%d)

case $DAY in 
	1)
		BACKUP_FILE="$(date +Backup_0_%w_%Y%m%d)"
		find /etc /home -exec tar -rf $BACKUP_FILE {} \;
		gzip $BACKUP_FILE
		touch flag.0;;

	10)
		BACKUP_FILE="$(date +Backup_1_%w_%Y%m%d)"
		find /home -newer flag.0 -exec tar -rf $BACKUP_FILE {} \;
		gzip $BACKUP_FILE
		touch flag.1;;

	20)
                BACKUP_FILE="$(date +Backup_2_%w_%Y%m%d)"
                find /home -newer flag.1 -exec tar -rf $BACKUP_FILE {} \;
		gzip $BACKUP_FILE
       		;;

	*)	echo "No backup planned"
esac

exit 0
