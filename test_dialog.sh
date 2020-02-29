# File Name: t.sh
# Author: hanhj
# mail: hanhj@zx-jy.com
# Created Time: 2020-02-27 07:05:01 week:4
#!/bin/bash
dialog	--clear \
		--title "slelet a dialog type:" \
		--menu "" 20 50 7 \
			"1" "yesno" \
			"2" "inputbox" \
			"3" "checklist" \
			"4" "fileselect" \
			"5" "guage" \
			"6" "menu" \
			"7" "getopt" \
			"8" "radiolist" \
			"9" "treeview" \
2>/tmp/tmp.$$
key=`cat /tmp/tmp.$$`
rm -f /tmp/tmp.$$
echo $key

case $key in
	1)
		#demo yesno message box----------------------------------------
		dialog	--title "Alert:Delete File" \
				--backtitle "Linux Shell Script Tutorial" \
				--yesno "\n Do you want to delete readme" \
				7 50 #长度 宽度
		sel=$?
		case $sel in
		0) echo "User sel delete file";;
		1) echo "User sel not delete file";;
		255) echo "User sel cancel";;
		esac;;

	2)
		#demo input box----------------------------------------
		dialog	--title "Inputbox -to take input from you" \
				--backtitle "Linux Shell Script Tutorial" \
				--inputbox "Enter your name" 9 60 \
		2>/tmp/input.$$
		sel=$?
		name=$(cat /tmp/input.$$)
		case $sel in
		0) echo "Hello $name";;
		1) echo "Cancel is Press";;
		255) echo "Esc is Press";;
		esac
		rm -f /tmp/input.$$;;
	
	3)
		#demo checklist box----------------------------------------
		dialog	 --title "This is a checklistbox" \
				--backtitle "service list" \
				--checklist "please sel service" 20 60 5 \
				"nfp" "Network time protocol" off\
				"sendmail" "SendMail mail Service" on\
				"httpd" "Apache Web server" off\
		2>/tmp/tmp.$$
		sel=`cat /tmp/tmp.$$`
		echo $sel
		rm -f /tmp/tmp.$$;;
	
	4)
		#demo file select box----------------------------------------
		# exec 3>&1 								#create channel 3,dup 1 and 3=1
		# file=`dialog --title "Please choose a file" \
		# 	--fselect $HOME/ 14 60 \
		# 	2>&1 1>&3`	#run a command and combine std channel 1 and 2
		# exec 3>&- 								#shut down channel 3
		# echo $file;;
		dialog	--title "Please choose a file" \
				--fselect $HOME/ 14 60 \
		2>/tmp/tmp.$$
		file=`cat /tmp/tmp.$$`
		echo $file
		rm -f /tmp/tmp.$$;;
	
	5)
		#demo file gauge----------------------------------------
		pct=10
		(
		while ((pct!=100))
		do
			echo "xx"
			echo $pct
			echo "the new\n message ($pct percent)"
			echo "xx"
			pct=$((pct+10))
			sleep 1
		done
		)|dialog --title "Gauge" --gauge "Hi ,this is a gauge" 20 70 0;;
	
	6)
		#demo menubox----------------------------------------
		dialog --clear \
			--title "Menu Box" \
			--menu "Hi ,this is a menu\n Choose the Os you like:" 20 51 4 \
				"Linux" "RedHat Enterprise Linux" \
				"Unix" "IBM AIX " \
				"WIN NT" "Miscrosoft Windows NT" \
		2>/tmp/tmp.$$
		menu=`cat /tmp/tmp.$$`
		echo $menu
		rm -f /tmp/tmp.$$;;
	
	7)
		#demo getopts---------------------------------------
		#getopts可以分析运行程序的参数，可以识别-xx后面所跟的参数。
		#getopts用法：getopts 需要识别的参数（用:分隔） 参数保存到的变量
		usage()
		{
			echo "Usage:./dia2.sh -a age -n name"
		}
		while getopts n:a: opt
		do
			case "$opt" in
				n) name="$OPTARG";;
				a) age="$OPTARG";;
				\?) usage;;
			esac
		done
		if [ $# -lt 1 ] ;then 
			usage
		else
			echo "Welcome $name,your age is $age"
		fi;;
	8)
		#radiolist
		dialog --title "test dialog" \
			--radiolist "select one" 20 50 3 \
				"nfp" "Network time protocol" off\
				"sendmail" "SendMail mail Service" on\
				"httpd" "Apache Web server" off\
		2>/tmp/tmp.$$
		ret=`cat /tmp/tmp.$$`
		echo $ret
		rm -f /tmp/tmp.$$;;
	9)
		#treeview
		dialog --title "test dialog" \
			--treeview "select one" 20 50 3 \
				"nfp" "Network time protocol" off 0\
				"sendmail" "SendMail mail Service" on 0\
				"httpd" "Apache Web server" off 1\
		2>/tmp/tmp.$$
		ret=`cat /tmp/tmp.$$`
		rm -f /tmp/tmp.$$
		clear
		echo $ret;;

esac
# vim:tw=72 
