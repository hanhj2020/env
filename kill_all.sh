# File Name: kill_all.sh
# Author: hanhj
# mail: hanhj@zx-jy.com
# Created Time: 2020-03-07 21:07:36 week:6
#!/bin/bash
#pids=`ps -e |grep $1|awk '{print $1}'`
pids=`pgrep $1`
echo $pids
if [ -z "$pids" ];then
	echo "not find $1"
	exit 1;
fi
for i in $pids;do
	sudo kill $i
done
# vim:tw=72 
