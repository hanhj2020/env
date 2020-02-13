# Linux环境学习

## 1. 帮助

**man 用户手册**

	选项：
	-k 正则表达式
		例如 man -k ls
	-M pathtoman.
		设置man手册查找路径 default is /usr/share/man 
	-t 将man手册转换成ps格式文件，并在标准输出中输出。
		可以用man -t xx |ps2pdf - xx.pdf将其转换成pdf文档。

		
**info 显示命令更多的信息**

	调用格式 ：
		info command
		info command submenu. info 文件可能有多个章节，submenu可以直接跳到该章节
		n	next section
		p	prev section
		t	top section
		u	up section 
		l	last section


## 2. 系统命令
**date 读取系统日期和时间**

	date命令可以定制输出格式
	date "%Y-"


**ntpdate	网络时间**

	ntpdate -q server 查询网络时间
	ntpdate server 修改系统时间 必须有root权限
	server:ntp1-7.aliyun.com


**adduser 添加用户**


**bc 计算器**

	bc -l 有小数点运算
	进入bc后scale=number可以设置小数位数，默认20
	bc可以简单的编程，例如求10的阶乘
		s=1;
		for(i=1;i<=10;i++)s=s*i;
		s 显示s


**passwd 修改用户口令**

	普通用户修改密码前需要输入原密码
	root用户不需要原密码，可直接修改

**who 查询当前登录终端用户**	

	-l	显示登录系统的用户（开机）	login
	-a	显示尽可能多的信息			all
	-H	打印表头					header
	可以显示出自从开机后曾经登录过的用户。

**whoami 显示当前用户名**

	相当于id -un

**id	显示当前用户uid gid**

	没有参数时显示当前用户的uid，gid
	带参数id username 显示该用户的uid gid
	-n	name 显示名字而不是数字
	-u	显示uid
	-g  显示gid
	-G	显示该用户所在所有组
**tty 显示当前终端设备文件名**

**stty	设置当前终端性质**

	-a 显示当前所有设置
**uptime 当前开机时间**

	显示系统当前，开机多长时间，多少用户登录，负载前1,5,15分钟状况。
	与w命令的第一行相同
	w命令用来显示当前登录的用户
**top 显示当前负载状况**

**free 显示当前内存状况**

**vmstat 系统负载**

	显示信息：
		r	运行态或就绪态的程序数量	run
		b	休眠态的程序数量			block
		si	从磁盘交换到内存的内存大小	swap in
		so	从内存交换到磁盘的内存大小	swap out
		bi	blocks	received from block device
		bo blocks send to block device
		us	user time of total cpu time
		sy	kernel time of total cpu time
		id	idle time of totoal cpu time
	选项
		-S	显示内存的单位，k，m，g or K，M，G前者按照10进制k=1000,m=1000000.。后者按照16进制K=1024,M=1024×1024.。。比如-Sk
	参数 
		delay	每隔delay时间调用。
		count	重复调用次数。如果只有delay没有count则永远调用。
**time 计算程序运行时间**

	调用格式：
		time 程序
**echo	将字符串输出到标准输出**

	调用格式：
		echo [options] xxx
	描述：
		将字符串xxx输出到标准输出。
	选项
		-e	解释\转义符
		-E	不解释\转义符
	也可以使用echo命令来执行命令。比如echo `ls`。
**read	从键盘接受输入**

	调用格式：
		read [options] var
	描述：
		从标准输入读字符串到变量var中。（以回车结束）
	选项
		-p	提示符
		-r	不解释\转义符。


ctrl-d	结束输入

## 3 文本处理

**more**

	操作：
		enter	下滚一行
		space	下滚一页
		q		退出
		/		search word
**less**

	操作：
		enter :foward a line
		space:foward a window
		j	foward a line
		k	bake a line
		z	foward a window
		w	back a window
		d	foward a half window
		u	back a half window
**cat	显示文本**

	选项：
		-n 显示行号
**od	显示十六进制数**

	选项：
		-c
		-tc
		-x1	十六进制，1个字节
		-d1	十进制，1个字节 
**head**

	选项：
		-n count
**tail**

	选项：
		-n	count
		-f	持续输出
**tee	三通。将标准输入输出到文件和标准输出**

	调用格式：
		tee [options] file 
	选项：
		-a 添加
**wc	统计文本文件字符数**

	选项：
		-l 统计行数
**sort**

	选项：
		-n 按照数值而不是按照字符串大小比较
**tr	替换字符**

	调用格式
		tr	被替换字符	替换后的字符
		tr命令没有文件名参数
		tr中的替换字符如果用数字表示，采用8进制
**uniq	消除重复行**

	重复行意思是相邻的行内容一致
	选项：
		-u 仅打印非重复行
		-d 仅打印重复行
		-c 统计次数
		不带参数打印非重复行和重复行（仅打印一次）

**文本类型**

	在unix下文本文件每行结尾只存换行字符<LF>,而在windows中，每行结尾保存2个字符<CR><LF。  
	CR	:carry return	：回车，回到开头（10进制13  8进制15 16进制0x0d \r - return）  
	LF	:line feed		：换行，进纸	 (10进制10  8进制12 16进制0x0a \n - new line)    
	可以用'unix2dos'将文本格式转换。  
	可以用file files来显示文件类型。  
	文件名首字符是ascii字符或汉字_。
	不过如果由于某种原因导致首字符是-,那就与一般程序的配置项重合，比如此时想要删除这个文件就会出错。为此可以用--来取消后面的-的作用。  
	比如rm -- -a.txt就可以删除叫-a.txt的文件了。如果要建立-a.txt文件，也可用类似的方法，比如vi -- -a.txt。


	在unix中通常采用utf-8编码来存储汉字，每个汉字3个字节。在windows中通常采用GBK编码，每个汉字2个字节。可以用iconv来做编码转换。

**iconv 文件编码转换**

	调用格式：
		iconv -f code1 -t code2 files
	选项：	
		-f from
		-t to 
		-o outputfile
**md5sum	求文件的md5散列值**

	调用格式：
		md5sum [options] files
	选项：
		-c sum_file 
		  通过计算原文的散列值与散列值比较，以确定文件是否有变动。此时源文件必须存在。
		例如：md5sum a.txt >sum_a,生成a.txt的md5散列值。
		md5sum -c sum_a 检查文件是否变动。
		md5sum生成128位的散列值（hash）
		sha1sum生成160位的散列值。

**regular expression正则表达式**

- 基本正则表达式：

		6个控制字符，即不是其原意义而具有特殊意义的字符,如果在匹配过程中需要其原来的意义，需要在其前面加转义符\
		. * [ \ ^ $
		除了以上6个控制字符外，其他字符在匹配过程中就是其原意义。
		转义符之后只能是上面六个控制字符，不应出现其他字符。
		.	可以匹配1个任何单字符
		*	匹配其前面字符的0次到多次，
		比如12*4,表示匹配2的0次到多次，如1224，12224,14都能匹配。
		[	表示一个字符集合开始
		\	表示转义其后的控制字符
		^	表示开头
		$	表示结尾
	
		[] 表示一个字符集合，在这个集合中除非在特殊位置，控制字符是其原义。
			- 字符，表示范围
			在字符集合中用-在两个字符之间，表示字符的一个范围。
			例如[a-z],表示a-z的字符集合。如果想匹配-，则应当将其放在最后。
			^ 字符 ，表示取补集
			^如果在[的开头，表示与字符集合之外的字符匹配。
			比如[^a-z]，则匹配任何非小写字母。如果想匹配^则应当将其放在不是第一个字符的位置。
			] 字符，表示匹配集合结束。
			如果想匹配]，应当将其放在第一个位置。

- 扩展的ere

		扩展的ere增加以下控制字符
		? + { | ( )
		() 表示分组，()中的字符是一个字符串，表示匹配这个字符串。
			比如(xas)，表示匹配xas。例如 egrep '(xas)',注意不能是 egrep (xas)。
			使用()做组匹配时，如果匹配上可以用\1,\2..表示前面的组字符串，这在输出时往往有用。
		|	表示逻辑或的关系。比如[ae]\|[bd]，表示匹配ae或者bd。或关系比较特殊只有在egrep中可以使用。
		+   表示匹配前面字符1次到多次。比如a+,表示匹配a至少一次。
		?	表示匹配前面字符0次到1次。比如a?,表示匹配a 0次或1次
		{}	{m,n},表示匹配至少m次，至多n次。比如a{3,4},表示匹配a至少3次，至多4次。
		以上控制字符如果在基本grep版本中使用时，需要在前面加上转义符\，即将普通字符转义成控制字符。
			例如grep 'a\+' ,grep 'a\{3\}' 。在扩展grep中转义符可以加也可以不加。

- 预定义的字符集合

		例如：
		[:xdigit:],表示十六进制的数字0-9,a-f，A-F 
		[:alnum:],表示字母和数字
		[:alpha:],表示字母 
		[:digit:],表示数字 0-9
		在grep中使用这些预定义字符集合需要在前面加上[],比如
			grep [[:alpha:]] xx 

		以下经过测试不正确：	
		\d ,表示数字
		\s,表示space
		\D，表示非数字。
		vi 中匹配空行^\s*$

还有pcre，perl compile regular expression  
更多的正则表达式可参见info grep regualr

**grep	在文件中搜索字符(global regualr expression print)**

	调用格式 
		grep optional PATTEN files 
	optional
		-E	按照扩展re来处理
		-F	按照固定字符串匹配算法处理，kmp算法。
		-G	按照基本re来处理。
		-P	按照pcre来处理。
			
		-n	显示行号
		-v	显示非匹配内容
		-i	不区分大小写
		-e 'command' 多个命令,例如 grep -e 'command1' -e 'command2' files
		-f command_file 

**sed	字节流处理程序，按行处理。**

	调用格式
		sed 'command' files
		sed -e 'command' -e 'command' .. files 多个命令
		sed -f command_file files 用命令文件处理文件
	选项
		-E	使用ere扩展正则表达式
	说明：
		使用\(patten\)做组匹配时，在匹配结果中可以用\1,\2。。作为替代匹配成功的字符串，用在结果输出中。
		比如:sed 's/\(a\)/\1BB/g' a.txt
		a.txt: abc	替换为：aBBbc

**awk	字符处理程序，按行处理，将行中字符分列。**

	调用格式：
		awk 'command' files
		awk -e 'command' files
		awk -f command_file files

		command 是一个程序,由条件和动作组成：条件{动作}
		条件可以是：
			1.无条件
			2.逻辑判断
			3./正则表达式/
		动作可以是：
			1.print 变量1 ，变量2 。。
			2.printf("format command")
		可选的在条件前可以加上BEGIN{动作}，表示在文件处理前的动作。
		在动作后可加上END{动作}，表示在文件处理后的动作。

		awk读入文本中每一行，然后依据command对每一行处理。
		内部变量：$0,表示整行，$1,表示被空格分开的第一个字符串，$2...
		NR	当前行数
		NF	当前列数
 		例子1：统计英文文本的单词出现频率
			cat README |tr '=><\.\-\(\)\[0-9\]@:/' ' '|tr ' \011' '\012'|grep -v '^ *$'|sort|uniq -c|sort -n|tail -n 20
			1.用tr命令将标点符号转换成空格
			2.用tr命令将tab或空格转换成换行。tr中用数字表示字符用\NNN,只能是8进制。011是TAB，012是换行。
			3.用grep去掉空行。^ *$,表示空行，-v表示取反，取不是空行的行。
			4.用sort排序。
			5.用uniq -c 去掉重复行，并列出出现次数。
			6.用sort -n 对出现次数排序。
			7.用tail -n 20 列出频率前20个结果。
## 4 文本比较

**cmp	文本逐字节比较**

 	cmp file1 file2
**diff	比较两个文本文件**

	调用格式：
		diff [options] files
		比如
			a文件 
				 1	aaa aaa
			     2	aaa aaa
			     3	bbb	bbb
				 4	ccc	ccc
			     5	ccc	ccc
			     6	ddd	ddd
				 7	aaa aaa
			b文件 
			     1	aaa aaa
			     2	bbb	bbb1
				 3	ccc	ccc
			     4	ccc	ccc
			     5	ddd	ddd
				 6	aaa aaa
			     7	hhh hhh
		不带选项的比较，diff a b
			2,3c2
			< aaa aaa
			< bbb	bbb
			---
			> bbb	bbb1
			7a7
			> hhh hhh
		
			c	表示change，表示前一个文件的行改变成第二个文件的行
			a	表示append
			d	表示delete

	选项
		-ux x表示显示改变的前后几行,不带数字默认是3
			例如 diff -u a b
				--- a	2019-02-24 12:25:07.976929800 +0800
				+++ b	2019-02-24 14:28:33.774140000 +0800
				@@ -1,7 +1,7 @@
				 aaa aaa
				-aaa aaa
				-bbb	bbb
				+bbb	bbb1
				 ccc	ccc
				 ccc	ccc
				 ddd	ddd
				 aaa aaa
				+hhh hhh
			前两行表示文件修改日期
			@@表示修改描述。其中，-表示前一个文件修改行号，+表示后一个文件文件修改行号。
			在-+符号后面的数字，前一个数字表示修改的起始行号，后一个数字表示修改的行数。
			在后面的具体描述中-表示删除，+表示添加。
			-u带数字会打印前后未修改内容，如果不想看未修改内容可用-u0.
				--- a	2019-02-24 12:25:07.976929800 +0800
				+++ b	2019-02-24 14:28:33.774140000 +0800
				@@ -2,2 +2 @@
				-aaa aaa
				-bbb	bbb
				+bbb	bbb1
				@@ -7,0 +7 @@
				+hhh hhh


## 5. 文件目录

**环境变量**

	HOME	用户主目录  
	.		进程当前目录  
	..		进程当前上一级目录  
	/		路径分隔

**ls	列出文件**

	选项
		-l	长格式
			第二列是link数，即有几个文件名指向给文件
		-d	显示目录本身，而不是目录下的文件
		-a	显示圆点文件
		-A	不显示圆点文件
		-F	显示flag
		-s	显示文件占磁盘大小，单位是块
		-S  按照大小排序，大在前。
		-r	将排序逆序
		-R	递归 
		-t	按照时间排序，新在前
		-i	显示inode
		-h	按照好理解的方式显示数字
**pwd	打印当前进程所在的目录**

	选项
		-P	打印绝对物理目录
		-L	打印相对目录
		不带参数时，默认是带-L选项
**mv	移动文件**

	调用格式：mv [options] from to 
			如果to不存在，则相当于将from改名为to
			如果to存在，且是一个目录，则将from移动到to下
			如果from,to都存在，则用from覆盖to。
			如果from,to在同一个文件系统中，mv仅仅是改变节点。
			如果不在同一个文件系统中，则是一个拷贝然后删除原文件的动作。
	选项
			-v	显示详细信息
**cp	复制文件**

	调用格式：
			cp options dir1 dir2
	选项：
			-u	仅拷贝更新的文件
			-v	显示详细信息
			-r	递归拷贝
**rm	删除文件**

	选项
		-r	递归
		-i	确认
		-f	force。强制删除只读文件

	如果命令行中包括以-打头的命令，比如删除 -i 这个文件，就不能用rm -i,这样-i被解释成选项。
	可以用 rm -- 取消后面的-作为选项的解释。同样的做法在其他命令中同样适用。
**mkdir	创建目录**

	选项
		-p	自动创建不存在的目录。例如mkdir a/b/c,自动创建a，b，c目录
**rsync	增量拷贝	**

	调用格式：
		rsync [options] src dest	:本地拷贝
		rsync [options] src [user@]HOST:dest	:从本地src远程拷贝到dest
		rsync [options] [user@]HOST:src dest	:从远程src拷贝到本地dest
	描述：
		rsync的有用之处在于它的增量拷贝，可以减少传输量。
## 6 shell

- **shell的作用：**

	shell是用户与操作系统之间的交互接口，相当于一个命令解释器，负责处理用户命令（如将*.cpp 展开多个文件），为运行程序建立环境。  
	Linux中有多种shell，比如sh，bash，csh，ksh，zsh。

- **shell中程序的执行**

	shell中程序执行方式有两种：  
	1）以当前shell为父shell，建立一个新子shell来执行。  
	2）在当前shell中执行。

	新子bash执行

		bash xx 或
		./xx
	在当前bash中执行 

		. xx 注意.和xx之间的空格。或
		source xx
		
		
- **shell中的变量：**

	- 定义变量

		var=xx  
		在shell中用var=xxx就可以给var变量赋值为xxx。 
		注意=两边不能有空格，否则bash将解释成命令和参数。


		let var=xx  
		用let var=xxx是数值赋值，即将数值xxx赋值给var，而不是数值字符串赋值给var。
	
		var=\`xx\`  
		执行命令xx，并将标准输出赋值给var。 
		比如:var=\`ls\`,就是将ls命令的执行后的输出赋值给var，然后就可以对$var进行处理（这里的\`是反括号，意思是执行其中的命令）。  
		此时屏幕不会显示ls的执行结果，即相当于将命令标准输出重定向到var中。

			常用的一些内部变量
			$0 表示程序名
			$1 表示第一个参数
			$2 表示第二个参数
			....
			$# 表示参数的数量
			$* 表示所有参数
			$@ 表示所有参数
			$? 表示返回结果
			$$ 表示程序的进程号
			
			0 表示标准输入
			1 表示标准输出屏幕
			2 表示错误输出
			1>&2将标准输出定向到标准错误输出
	
		
	- **数组**

		变量也可以是数组，用var[1]=xxx,var[2]=xxx。就产生var变量数组。bash支持一维数组。

	- **引用变量**

		$var,或${var}。 
		shell看到这个语法，将会把$var替换成所定义的值。在应用时最好"$var",这样可以防止当$var是空字符串的时候，使得表达式出现错误。  
		如果var中还要包括变量，则要用${var}.  
		比如var数组中包括2个变量，i表示数组下标，则可以用${var[$i]}来引用数组中的变量。

	- **变量范围：**

		在shell中所定义的变量，在新的shell中运行时这些变量将会失效。  
		如果以第一种方式运行程序，则子shell不会继承父shell所定义的变量，即父shell中所定义的变量在子shell中无效。  
		如果以第二种方式运行程序，由于是在当前shell中运行程序，所以自然可以使用这些变量。  
		如果想在子shell中使用这些变量，可以在父shell中将这些变量通过export var变为环境变量。  
		在子shell中可以修改这些变量，但不会影响父shell中同名变量。

- **shell命令行中的元字符：**

	元字符就是具有特殊含义的字符，shell遇到这些字符会做特殊处理

		空格	作为参数的分隔符
		;		命令结束
		$		变量
		()		在子shell中执行后面的命令。或者定义一个函数
		{}		在当前shell中执行后面的命令
		|		管道
		>		重定向输出
		<		重定向输入
		*?[]	文件名通配符
		`		执行命令
		'',""	表示一个字串
		&		后台运行。
		\		转义符，对以上元字符取消其特殊作用。对非元字符前加\还是其原来意义。 	

- **shell中引号：**

	shell的元字符在引号中，大部分失去其特殊意义，但是shell中的引号对于元字符的作用不尽相同。

	-	':单引号

			单引号中元字符都失去意义，包括转义符。如果其中有'，则需要用'将前面的内容结束，然后用\'表示',此时如果后面还有内容则用'再继续。  
		比如有dont't do this.如果想用'表示上面内容，则需要'dont'\''t do this'.即如果想匹配abc'def,就要'abc'\''def'，将'前后两部分用''包起来。

	-	":双引号

			双引号中仅保留$var,``，\。如果双引号内容中有$或`,\,"用作原义，则必须做转义\$,\`,\\,\"。

	- \`:反引号

			反引号用作执行命令，其中内容不允许再出现`，如果出现必须用转义符。
			比如files=`echo \`ls -l\``。其他内容等同于在原来的命令行，元字符具有其特殊意义，该转义的地方还是要转义。

		反引号的返回值：  
			如果ret=`command`,其是将command的标准输出结果到ret变量中。相当于重定向，即将标准输出重定向到ret变量中。 
			如果想知道command是否执行成功，要看$?的结果。 
			$?的结果是个字串0，或1。 0代表执行成功，非0代表执行失败。判断时：if [ $ret = "0" ] then;echo "successful";else echo "fail";fi;  
		注意用=，而且=两边要留空格，不像赋值时两边不能有空格。原因是[ 实际是一个程序，其里面的参数实际上是作为参数输入给 [,为了区别各个参数，所以需要用空格将各个参数分开，就像命令行一样。  

- **shell中的转义**

	在shell中，首先由bash对命令行进行处理，包括对转义的处理，然后将处理后的命令行交给所调用的程序，由程序对命令行进行处理。因此，转义包括多个层次。

		举个例子，如果文件ip.txt中是下面内容：
		lenov '192.168.0.102'
		dell '192.168.0.103'
		想找到包括'192.168.0.102'的行
		grep \'192\\.168\\.0\\.102 ip.txt
		为何要用\\因为grep本来的匹配字串应当为
		'192\.168\.0\.102'
		而在bash中\作为转义符将首先将\.转义成.(不是特殊字符还是字面意思)
		这样grep得到的就是：192.168.0.102,而这样在grep中.代表字符通配符，可以匹配任何一个字符。头一个\'表示取消bash对'的解释。
		也可用''包括命令：
		grep \''192\.168\.0\.102'\' ip.txt
		或者用""包括命令：
		grep "'192\\.168\\.0\\.102'" ip.txt 

- **shell的重定向：**

	- **输入重定向：**

			prog < xxx
		liunx许多程序默认的输入是标准输入，如果不带参数，就是用标准输入作为输入。如果有文件作为参数，就用文件作为标准输入。  
		采用一个<号，表示将xxx作为prog的参数而替代了标准输入。与prog input 相同，

			prog << xxx 
		采用两个<号表示xxx作为分界符，在其后的内容作为prog的输入，直到再次遇见xxx。

			prog <<< xxx
		采用三个<号表示，将xxx作为prog的输入。
	- **输出重定向：**

			prog > file 
		将标准输出重新定向到文件file，如果file不存在就新建，否则覆盖。

			prog >> file 
		将标准输出重新定向到文件file，如果file不存在就新建，否则追加。

		标准输入文件文件符是0,标准输出文件符是1,标准错误输出是2.  
		在bash中可以直接使用这3个文件描述符。  
		默认的错误输出和标准输出都是指向屏幕。  


		以上的>只是将标准输出重定向，实际上相当于1>file,并没有将错误输出重定向。如果想将错误输出与标准输出重定向一致，可以用2>&1 。或者不想看到错误输出可重定向到null设备2>/dev/null .
			
		举个例子：

			myapp > log 2>&1 :将标准输出和错误输出重定向到log文件中。重定向过程：
			第一步默认	第二步 1>log		第三步 2>&1
			1->stdout	1->log				1->log
			2->stderr	2->stderr			2->1
			所以最后标准输出和错误输出都将输出到log中。
			但是如果：
			myapp 2>&1	>log:错误输出将仍然输出到屏幕，标准输出到文件log中。重定向过程：
			第一步默认	第二步 2>&1			第三步 >log
			1->stdout	1->stdout			1->log
			2->stderr	2->stdout			2->stdout
			所以最后标准输出重定向到log中，错误输出仍然将输出到log中。

	- **管道：**

		管道是将前一个程序的标准输出与下一个程序的标准输入相连接。将前一个程序的标准输出作为后一个程序的标准输入。  
		ls |grep aaa.会看到什么？  
		这个命令是在当前目录中找是否有包括aaa作为文件名的文件。而不是在列出文件中查找aaa的内容。  
		如果想这么做应当将列出的文件作为参数给grep，实现这个功能的是xargs,命令为ls | xargs grep aaa 。  
		xargs的功能是将前面命令的输出作为参数附加到后面一个命令中。如果命令行太长，可以用-s来扩大，最长为128kb。

- **条件判断：**

	shell判断一个程序是否执行成功，是看程序返回值是否为0,如果是0,表示执行成功;结果非0,表示执行不成立。  
	在shell中的条件判断有test或者[。注意[是一个程序，和test这个程序是一样的。  
	比如test $a = 9 或者 [ $a = 9 ].test和[的唯一区别在于用[后面必须跟上]。  
	还有一点就是既然[是一个程序，后面的内容就是其参数，所以[后面必须跟一个空格。  
	test判断内容包括：

		1.判断文件类型。比如 
			-d 判断是否是目录
			-e 是否存在
			-r 是否可读
			-w 是否可写
			等等
		2.判断字符串或数字的逻辑关系
			= 是否相等
			!= 
			>
			>=
			用于数字判断
			-eq	相等
			-ne 不等
			-gt 大于
			-lt	小于
			等等
			注意1：条件判断符两边也要有空格分开。比如：
			[ $a = a ]
			否则test或[程序会将其连在一块，而不是作为多个参数。
			另外，对于$var这样的变量在条件中最好用“$a”将其扩起来，以防止$a是一个空值时，导致逻辑不对。
			注意2：如果条件判断符是shell元字符，注意要转义。比如：
			[ $a \> $b ]
			否则shell将会把>解释成重定向。或者在新的shell中可以用[[ $a > $b ]]来表示。
		3.在条件判断中可以用 -a 表示两个条件与，-o表示两个条件或，将多个条件链接起来。比如 
			[ $a = a -a $b = b]	

- **表达式expr：用于计算表达式的值。**

	expr读入表达式，计算其结果，并将结果输出到标准输出。 
	expr 表达式可以用来实现四则运算，关系运算，逻辑运算，正则表达式运算  
	expr的运算符：  

		四则运算符：(),+,-,*,/,%
		关系运算：>,<,=,>=,<=,!=
		逻辑运算：&,|
		正则表达式 expr str : regualr

		expr1 \> expr2	:print result expr1>expr2 . 1(expr1>expr2) or 0(expr1<=expr2)
		expr1 \| expr2	:print expr1 如果expr1非空或非0,否则print expr2	
		expr1 \& expr2	:print expr1 如果expr1,expr2都非空或非0 

	expr的返回：

		0：如果计算结果非空或非0
		1：如果计算结果为空或0
		2：如果表达式有错

		注意1：在表达式中可能出现元字符，这是需要做转义。

			比如：expr $a \> $ b,因为>在shell中是元字符。
			需要转义的：(),*,>,<,&,|
		注意2：如果在shell的条件判断中用到程序，则shell是根据程序的返回值来判断。  
		所以如果用expr作为shell的条件判断，不要用其返回值，而是要用其输出结果，否则返回的都是真，仅表示执行expr程序成功。  
		比如：[ `expr $a \> $b ` = 1] && echo "a>b".


		在正则表达式中有一个特殊作用，就是从前面字串中挖出特殊字段，比如：
			expr abcdefg : '.*\(d\)',从字串中挖出d。这里用''表示对里面的元字符bash不做处理，这样就避免了多次转义，里面的内容就是正则表达式的内容。
	
		一个例子，比如我们想知道ping一个地址的返回时间。
		64 bytes from 110.43.83.1 (110.43.83.1): icmp_seq=1 ttl=51 time=26.2 ms,
		str=`ping www.sohu.com -c 1 |grep from`;
		expr "$str" : '.*time=\(.*\)ms'

- **shell的复合逻辑**

	与条件中的条件组合不同，这里的复合逻辑是指多个条件的组合。比如  

		 $a = a ] && [ $b = c ].
	当然这个逻辑关系也可以用[ $a = a -a $b = c ]来表示，但是这里仅仅是示意。更多的情况是将条件2用作动作。  
	因为在shell中如果有两个条件用与符号&&连接，则shell首先判断条件1,如果条件1成立才执行条件2判断，这样就往往用此方式来判断条件1,如果成立则执行条件2中的动作。  
	类似的还有逻辑或||。
	
		[ -d aaa ] && echo is dir 
	判断aaa是否是目录，如果是打印is dir。
	
	如果想执行多条语句可以用：  

		( ... )	在子bash中运行  
		{ ... ;} 在当前bash中运行。  
		如果多条语句在同一行中需要在}前面加;。}不是元字符，需要用;来结束命令。如果在不同行，就不需要了。

- **shell的过程控制**

	if 条件控制

		if 条件
		then
			。。。
		elif 条件
			then
				。。。
		else	
			。。。
		fi 

	or:写在一行：

		if [ "$a" = a ] ;then echo "\$a is $a";fi
		在if中if，then,elif,else,fi是关键字，必须在一行的头。
		同时，不像c语言中if语句必须用{}匹配动作，由于在bash中用if与fi，then与else匹配，所以可以不加{}来匹配。
			
	例如：想杀死所有进程名为myapp的进程

		pids=`ps -e|grep myapp|awk '{print $1}'`
		if [ "$pids" != "" ];then
			echo will kill myapp $pids
			kill "$pids"
		else
			echo not find myapp
		fi

	case 控制 

		case word in 
			para1) list1;;
			para2) list2;;
		esac
	例如：

		case "$1" in 
			start)
				echo strat $0
				;;
			stop)
				echo stop $0
				;;
			restar|re) //条件或
				echo stop $0
				echo start $0
			*)
				echo "Usage:$0 [start|stop|restart]"
				;;
		esac

	循环控制

		while condition 
		do 
			...
		done
	Or：

		while condition ;do ... ;done

	例如：ping sohu.com这个网站，直到键入q或Q。

		while true ;do 
			ping -c 1 -w 1 www.sohu.com 
			read -n 1 -t 1 c
			[ "$c" = q -o "$c" = "Q" ] && break
		done

		for var in [seq];do 
			...
		done 

		seq 这个条件可有也可无，如果无var变量从命令行中取$1,$2...
		也可是一个命令的输出比如：
			for i in `find .`
			或者是一个数字序列：
			for i in `seq 1 10`

