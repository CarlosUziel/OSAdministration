#!/bin/ksh

while [[ 1 ]]
do
	select i in LS PWD DATE EXIT
	do
		case $i in
			LS) ls -l ;; 
			PWD) date ;;
			DATE) pwd ;;
			EXIT) exit ;;
		esac
	done
done
