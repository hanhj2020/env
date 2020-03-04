# bash简单应用

**bash**是一个用户与操作系统之间的可以交互的应用接口。可以直接通过命令行方式，也可以通过批处理的文本方式。文本方式通常称为脚本，在脚本的第一行#! /bin/bash 表示解释脚本的程序

## 1. 变量

	var=xx      
赋值字符串


	let var=xxx 
赋值数字，十进制直接表示，八进制0xx，十六进制0xxx


	let c=$((a*b)) or let c=$a*$b
相比而言，后者更为简洁。

	$var
引用变量：

$0 表示程序名  
$1 表示第一个参数  
$2 表示第二个参数  
....  
$# 表示参数的数量  
$* 表示所有参数  
$@ 表示所有参数  
$? 表示返回结果  
$$ 表示程序本身的文件id（数字,每次运行不一样）  

0 表示标准输入  
1 表示标准输出屏幕  
2 表示错误输出  
1>&2将标准输出定向到标准错误输出  


\" \" 表示引用字符串,展开$,不展开通配符;执行\转义  
\'\' 表示不展开  
\`\` 表示执行命令  

\*    表示通配符  
\?    表示通配一个  
[abc]表示abc中的一个  
[a-c]表示a-c中的一个  
[^ac]表示除ac之外的  


转义  
\\a	bell  
\\b	退格  
\\r	回车  
\\n	new line  
\\xnn	十六进制  
\\nnn	八进制  
\\uhhhh	unicode  
\\cx	控制字符  

## 2. 变量操作：

字符串连接 ：val=$a$b"abc"  
数字操作： let a=a operatrion b  


表达式：expr 操作数 计算符 操作数  
expr 1 + 3,注意有空格  
计算符：+ - \* / %:乘号要用转义符  
bc :控制台计算器，在bc中，可以做复杂运算。  
输入bc：  
然后可以5/2,3×9,b==10等简单的运算与逻辑判断。  
bc中可以做函数，控制结构，还包括数学库函数（启动时带-l选项）。 
s(x)-sin;c(x)-cos;a(x)-arc;l(x)-log;e(x)-exponential;j(n,x)-bessel


## 3. 控制语句

;：分号用来分割命令.比如


	data;who;

### 3.1 比较

在bash中返回0表示成功，1表示失败


比较


|字符串比较|数字比较|
|------|--------|
|=|-eq|
|>|-gt | 
|<|-lt |
|!=|-ne|
|<=|-le|
|>=|-ge|

### 3.2 条件 


	if expr ;then xxx;fi
	if expr ;then xxx;else xxx fi;
expr 必须是一个带命令的表达式，否则报错。例如：

	if test -a 1.txt ;then echo "i have 1.txt";fi;
	if (test -a 1.txt);then echo "i have 1.txt";fi;
	if (test -a 1.txt);then echo "i have 1.txt";else echo "i have not 1.txt";fi;
	test -a 1.txt && echo "i have 1.txt"//使用&&表示联合操作。
	if [ 条件 ] ;then
		do something
	elif [ 条件 ];
		do something
	else
		do something
	fi 
注意:这里test和[实际上都是一个程序，用来进行判断。由于命令中各个部分需要用空格分开，所以对于[的两边需要有空格（]是不必要的，但是为了好理解，还是加上为好）。  
()起到的是集合作用  
条件以0为真,1为假  
采用的比较符注意字符串和数字是不一样的

多个条件时 -a 表示and，-o 表示 or

为了更方便c程序员使用，对于bash的条件也可以使用类似c语言的风格：


	if (( expr ));then xxx;
采用((条件))则以1为真,0为假。  
当使用(())时，对于变量可以不加$符号。
使用(())更符合c程序的风格。比如


	let a=15
	let b=15
	if [ $a -eq 15 ];then echo '$a is 15';fi;
	if ((a==15));then echo '$a is 15';fi;  
	if ((a==15&&b==15));then echo '$a and $b  is 15';fi;

使用[[ 条件 ]]：多个条件可以为&&,||，这时就不能使用-a -o了。


	case 变量名 in
	 匹配1) 命令1;;
	 匹配2) 命令2;;
	 匹配3) 命令3;;
	esca

### 3.3 循环

	for 变量名 in 列表
	do
	do something
	done
	
	while [ 条件 ]
	 do
		do something
	 done

## 4 函数

### 4.1 测试函数：test 
作用：测试文件  
用法：test -x file 


-a	文件是否存在  
-b	是否是块设备  
-d	是否是目录  
-s	文件大小为0  
-r	是否可读  
-w	是否可写  
-x	是否可执行  
-e	文件是否存在  
-g	文件是否存在,且具有groupid  
-f	文件是否存在,且是都是一般文件  
-h	文件是否存在,且是个连接  
-p	文件是否存在,且是个fifo  
-o	文件是否存在,且被有效拥有.  
-s	文件是否存在,且是个socket  
 
### 4.2 read
作用：从键盘输入数据，保存到变量中  
用法：read：read var1 var2 ...

### 4.3 颜色 
作用：用转义序列控制字符显示  
用法：ESC[front_color;back_color


\\NNN	8进制  
\\xNN	16进制  
  
  
\\033[背景色;前景色m  
\\033[前景色m  
\\033[背景色m   
\\033[0;m还原  
m表示换行，否则不换行。  
03x---前景色  
04x---背景色  
0 黑色  
1 红色  
2 绿色  
3 黄色  
4 蓝色  
5 洋红  
6 青色  
7 白色  

### 4.3 自定义函数

	fun_name (){
		...
	}

例子：

	dialog
	#! /bin/bash
	#demo yesno message box----------------------------------------
	dialog --title "Alert:Delete File" \
	--backtitle "Linux Shell Script Tutorial" \
	--yesno "\n Do you want to delete readme" \
	7 50 #长度 宽度
	sel=$?
	case $sel in
	0) echo "User sel delete file";;
	1) echo "User sel not delete file";;
	255) echo "User sel cancel"
	esac
	#demo input box----------------------------------------
	dialog --title "Inputbox -to take input from you" \
	--backtitle "Linux Shell Script Tutorial" \
	--inputbox "Enter your name" 9 60 
	sel=$?
	2>/tmp/input.$$
	name=$(cat /tmp/input.$$)
	case $sel in
	0) echo "Hellooo $name";;
	1) echo "Cancel is Press";;
	255) echo "Esc is Press";;
	esac
	rm -f /tmp/input.$$
	
	#demo checklist box----------------------------------------
	dialog --title "This is a checklistbox" \
			--backtitle "service list" \
			--checklist "please sel service" 20 60 5 \
			"nfp" "Network time protocol" off\
			"sendmail" "SendMail mail Service" on\
			"httpd" "Apache Web server" off
			2>/tmp/tmp.$$
	rm /tmp/tmp.$$
	
	#demo file select box----------------------------------------
	exec 3>&1 								#create channel 3,dup 1 and 3=1
	file=`dialog --title "Please choose a file" \
		--fselect $HOME/ 14 60  2>&1 1>&3` 	#run a command and combine std channel 1 and 2
	exec 3>&- 								#shut down channel 3
		 echo $file
	
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
	)|dialog --title "Gauge" --gauge "Hi ,this is a gauge" 20 70 0
	
	#demo menubox----------------------------------------
	dialog --clear --title "Menu Box" --menu "Hi ,this is a menu\n Choose the Os you like:" 20 51 4 \
	"Linux" "RedHat Enterprise Linux" \
	"Unix" "IBM AIX " \
	"WIN NT" "Miscrosoft Windows NT" 2>/tmp/temp.$$
	echo `cat /tmp/temp.$$`
	rm -f /tmp/temp.$$
	
	#demo getopts----------------------------------------
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
	if [ $# -lt 1 ] ;then usage
	else
	echo "Welcome $name,your age is $age"
	fi
	
	
	
