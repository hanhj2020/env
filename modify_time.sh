# File Name: a.sh
# Author: hanhj
# mail: hanhj@zx-jy.com
# Created Time: 2019-07-17 18:31:50 week:3
#!/bin/bash
#从文件名中提取xxxx-xx-xx时间，然后将该文件的时间改为文件名的时间。
#原因是保存文件时的时间可能与文档真实时间不一致，导致列文件时，不能
#真正按照时间顺序排列。
#步骤：
#1。按照时间格式，过滤文件，只针对具有时间的文件名文件操作。
#2。将文件名中的时间提取出来，方法是用match函数i,j是时间字串的起终位置。
#3。用substr提取时间字串。
#4。用split将时间字串分割，然后用sprintf重新组合，目的是符合touch命令的格式。
#5。用system命令，调用touch命令来修改文件时间。
ls -rt|awk '/[0-9]+-[0-9]+-[0-9]+/{i=match($0,/[0-9]+-[0-9]+-[0-9]+\./);j=match($0,/\..*/);str=substr($0,i,j-i);split(str,A,"-");str=sprintf("%4d%02d%02d0000",A[1],A[2],A[3]);print str;system("touch "$0"  -t "str)}'
