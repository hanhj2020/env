# File Name: mk.sh
# Author: hanhj
# mail: hanhj@zx-jy.com
# Created Time: 2020-02-14 17:15:24 week:5
#!/bin/bash
files=`ls --hide=index.html|grep html`
if [ -z "$files" ];then exit 1;fi
cat <<eof |tee index.md
|文件|
|:--------|
eof

for i in $files;do
	str="|[`basename $i .html`]($i)|"
	cat <<eof|tee -a index.md
${str}  
eof
done
pandoc index.md -o index.html -c dox.css 
rm -f index.md
# vim:tw=72 
