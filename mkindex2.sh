# File Name: mk.sh
# Author: hanhj
# mail: hanhj@zx-jy.com
# Created Time: 2020-02-14 17:15:24 week:5
#!/bin/bash
files=`ls --hide=index.html|grep html`
if [ -z "$files" ];then exit 1;fi
echo "|文件|" >index.md
echo "|:--------|">>index.md

for i in $files;do
	str="|[`basename $i .html`]($i)|"
	echo $str>>index.md
done
pandoc index.md -o index.html 
rm -f index.md
# vim:tw=72 
