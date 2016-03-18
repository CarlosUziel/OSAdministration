#!/bin/ksh

printUsage () {
	print "Usage: Verifica_Segur1 --ndias n"
}

if [[ $# -ne 2 ||  $1 != @(--ndias) || $2 -lt 1 ]]
then
	print -u2 "Wrong invocation"
	printUsage
	exit -1
fi

# All users with their UID
loginUsers=$(cut -f1,3 -d: /etc/passwd)
# All users without login records since $2 days
nologedUsers=$(lastlog -b $2 | cut -f1 -d" ")

# For each user, check its login availability, then check account expiration date and lastlog record.

for i in $loginUsers
do
	# Get user login
	USR=${i%:*}
	# Get user ID
	UID=${i#*:}

	# Check if user can log
	if (( $UID > 499 && $UID < 65534))
	then
		# Check if expiration date field is empty
		if [[ -z $(grep ^$USR: /etc/shadow | cut -f8 -d:) ]]
		then
			echo $(date +%Y%m%d:%H%M):$USR >> /root/log_cuentas_archivos_inseguros
			continue
		fi
		
		# Check if user has not logged		
		for j in $nologedUsers
		do
			if [[ $j == $USR ]]
			then
				echo $(date +%Y%m%d:%H%M):$USR >> /root/log_cuentas_archivos_inseguros	
				break
			fi
		done

	fi
done

# Look for insecure executables

catalog="/root/catalog_arch_setuid_setgid"
# Look for files with setuid or setgid
files=$(find -type f -perm /4000 -o -perm /2000)

for i in $files
do
	exec 0<$catalog
	
	# Check if file is inside catalog
	while read LINE
	do
		if [[ $i == $LINE ]]
		then
			continue 2
		fi
	done

	echo $(date +%Y%m%d:%H%M):$i >> /root/log_cuentas_archivos_inseguros
done

exit 0