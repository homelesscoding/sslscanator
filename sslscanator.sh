#!/bin/bash

# SSLscanator v0.3.0

OPTARG=" "

while getopts "t:l:" arg; do
	case $arg in
	t) 
		target=`echo $OPTARG | cut -d ":" -f 1`
		mkdir $target-temp
		sslscan --no-color --no-failed --no-heartbleed --no-compression --no-renegotiation --no-fallback $OPTARG > $PWD/$target-temp/${OPTARG/:/_}
		;;
	l)
		target=$OPTARG
		mkdir $target-temp
		for i in `cat $OPTARG`;do
			sslscan --no-color --no-failed --no-heartbleed --no-compression --no-renegotiation --no-fallback $i > $PWD/$target-temp/${i/:/_}
		done
		;;
	esac
done
temp=$PWD/$target-temp
#-------------------------------------------------#
grep -il --no-filename "SSLv2     enabled" $temp/* >> /dev/null
if [ $? -eq 0 ]; then
	echo "------SSLv2------" >> $PWD/$target-report
	grep -il --no-filename "SSLv2     enabled" $temp/* | rev | cut -d "/" -f 1 | rev >> $PWD/$target-report
	echo " " >> $PWD/$target-report
	echo " " >> $PWD/$target-report
else
	echo " "  >> /dev/null
fi
#-------------------------------------------------#
grep -il "SSLv3     enabled" $temp/* >> /dev/null
if [ $? -eq 0 ]; then
	echo "------SSLv3------" >> $PWD/$target-report
	grep -il "SSLv3     enabled" $temp/* | rev | cut -d "/" -f 1 | rev >> $PWD/$target-report
	echo " " >> $PWD/$target-report
	echo " " >> $PWD/$target-report
else
	echo " "  >> /dev/null
fi
#-------------------------------------------------#
grep -il "TLSv1.0" $temp/* >> /dev/null
if [ $? -eq 0 ]; then
	echo "------TLSv1.0------" >> $PWD/$target-report
	grep -il "TLSv1.0" $temp/* | rev | cut -d "/" -f 1 | rev >> $PWD/$target-report
	echo " " >> $PWD/$target-report
	echo " " >> $PWD/$target-report
else
	echo " "  >> /dev/null
fi
#-------------------------------------------------#
grep -il "CBC3" $temp/* >> /dev/null
if [ $? -eq 0 ]; then
	echo "------SWEET32------" >> $PWD/$target-report
	grep -il "CBC3" $temp/* | rev | cut -d "/" -f 1 | rev >> $PWD/$target-report
	echo " " >> $PWD/$target-report
	echo " " >> $PWD/$target-report
else
	echo " "  >> /dev/null
fi
#-------------------------------------------------#
grep -il "RC4" $temp/* >> /dev/null
if [ $? -eq 0 ]; then
	echo "------RC4------" >> $PWD/$target-report
	grep -il "RC4" $temp/* | rev | cut -d "/" -f 1 | rev >> $PWD/$target-report
	echo " " >> $PWD/$target-report
	echo " " >> $PWD/$target-report
else
	echo " "  >> /dev/null
fi
#-------------------------------------------------#
grep -il "SSLv3     enabled" $temp/* >> /dev/null
if [ $? -eq 0 ]; then
	echo "------POODLE------" >> $target-report
	grep -il "SSLv3" $temp/* | rev | cut -d "/" -f 1 | rev >> $PWD/$target-report
	echo " " >> $PWD/$target-report
	echo " " >> $PWD/$target-report
else
	echo " "  >> /dev/null
fi
#-------------------------------------------------#
grep -il -e " 56 bits" -e " 40 bits" $temp/* >> /dev/null
if [ $? -eq 0 ]; then
	echo "------Short key length of cipher suites enabled (Less that 128 bits)------" >> $PWD/$target-report
	grep -il -e " 56 bits" -e " 40 bits" $temp/* | rev | cut -d "/" -f 1 | rev >> $PWD/$target-report
	echo " " >> $PWD/$target-report
	echo " " >> $PWD/$target-report
else
	echo " "  >> /dev/null
fi
#-------------------------------------------------#
grep -il -e " 56 bits" -e " 40 bits" $temp/* >> /dev/null
if [ $? -eq 0 ]; then
	echo "------Short key lenght of DHE cipher suites (Less than 2048 bits)------" >> $PWD/$target-report
	grep -il "RSA Key Strength:    1024" $temp/* | rev | cut -d "/" -f 1 | rev >> $PWD/$target-report
	echo " " >> $PWD/$target-report
	echo " " >> $PWD/$target-report
else
	echo " "  >> /dev/null
fi
#-------------------------------------------------#

rm -fr $temp
