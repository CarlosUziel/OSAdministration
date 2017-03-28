#!/bin/ksh

for i in $(find prueba)
do
	if [[ -d $i ]]
	then
		continue
	fi

	print $i:$(cksum $i):$(ls -l $i | cut -f1 -d" ") >> catalog
done

exit 0
