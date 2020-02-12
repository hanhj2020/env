# File Name: a1.sh
# Author: hanhj
# mail: hanhj@zx-jy.com
# Created Time: 2019-05-18 19:13:56 week:6
#!/bin/bash
let a=2
let b=4
if ((a>1||b>3));then
	echo or is true
else
	echo or is false
fi
if [  $a -gt 1 -o $b -gt 3 ];then 
	echo or is true
else
	echo or is false
fi 
if ( [ $a -gt 1 ] &&  [ $b -gt 3 ] );then
	echo or is true
else
	echo or is false
fi
read -p "input" var
case $var in 
	y) echo 1	;;
	n) echo 2	;;
	*)	echo ddd;;
esac
echo $$
echo $*
echo $@
echo $#
echo $0
