#Linux应用环境学习


##Linux系统的组成：

	 --------------------------
	|	应用程序				|	
	|---------------------|		|
	|	库函数				|	|
	|---------------|		|	|
	|	系统调用	|		|	|
	|	 -----		 ------		|
	|	|内核 |		|shell	|	|
	|	 -----		|		|	|
	 --------------- -----------

![shell.bmp](shell.bmp) 

##终端:

无终端的情况下：打开一个新终端

	ctrl+alt+t
	
在一个已经打开的终端中：打开多个终端标签

	ctrl+shift+t
打开多个终端

	ctrl+shift+n

切换多个终端:

	alt+数字
	ctrl+pageup,pagedown

历史命令：

1. 用上下键来查找；

2. 可以输入history命令，   
此时会显示出最近的历史命令，可选项有-n 表示显示多少最近的历史命令，显示出来后可以输入“!命令编号”来执行此命令，!!表示执行最近的命令；

3.  敲“ctrl-r”组合键，  
	然后输入字符，此时会显示出与你输入字符最接近的最近命令，回车后就可以执行；

4.  fc命令可以查阅历史命令，  
	同时可以调用编辑器来修改此命令然后执行。-l 表示列出历史命令，列出来之后可以fc （+）命令编号编辑此命令，也可以fc - 数字表示与最后一条命令的偏差，举例-1表示最后一条，-2表示倒数第二条。


##ubuntu下的窗口操作：
ctrl+alt+上下左右键：切换到不同工作区；   
ctrl+shift+alt+上下左右键：将当前窗口移到不同工作区；   
ctrl+win+↑：最大化当前窗口；   
ctrl+win+↓：最小化当前窗口；   
ctrl+win+←：当前窗口移动到当前工作区的左边，并放大到一半的宽度；   
ctrl+win+→：当前窗口移动到当前工作区的右边，并放大到一半的宽度；   
alt+tab：在当前工作区中切换程序窗口；   
alt+`：在当前窗口切换同一类程序的多个窗口；   
win：弹出命令输入窗口；   
alt+f2：弹出另一个命令输入窗口；   
ctrl-l:在ubuntu的文件夹窗口中显示路径。   
xx & :	将程序放到后台运行：   
jobs :查看当前后台运行的程序   
fg [job号]：将后台运行程序调到前台。不带参数就是最后一个进入后台运行的程序。fg 1,fg 2 就是前面jobs查看的第一个任务数字   
bg [job号]：让后台暂停的程序继续运行。举例我们用xx &将某个gui界面的程序后台运行，不小心用fg调到前台，这时只有关掉这个程序，才能继续在当前终端中输入。此时可以用ctrl-z将当前程序暂停，这时就可以回到终端界面。然后bg，让这个程序继续在后台运行。   
ctrl-z:	将前台运行的程序放到后台并挂起   
   

##截屏：
prtsc键-全屏   
shift+prtsc 区域截取   
alt+prtsc 截取当前窗口   
ctrl+prtsc 全屏截取到剪切板   
   
##vi
1. 介绍  
　vi和vim是我们在Linux中最常用的编辑器。vi或vim是Linux最基本的文本编辑工具，vi或vim虽然没有图形界面编辑器那样点鼠标的简单 操作，但vi编辑器在系统管理、服务器管理中，永远不是图形界面的编辑器能比的。   
　vi中有三种模式：编辑模式，就是处于输入字符的状态光标在编辑区。进入编辑模式的方法是键入“i”或“a”表示insert或append；   
　命令模式，就是处于命令输入状态，光标在底下的命令窗口中，如果在编辑模式，进入命令模式的方法是按esc键然后输入“：”；   
　普通模式就是不属于编辑模式和命令模式的状态。   
　[ctrl]+[f] : 向前翻页(foreward)，和 [Page Down] 的用法一样。   
　[ctrl]+[b] : 向后翻页(backward)，和 [Page Up] 的用法一样。   
   
2. 在普通模式中的光标移动:   

	    	k   
		h		l   
			j   
　h向左移动，l向右移动，k向上移动，j向下移动   
　w  向后跳转word,光标在word的首位置.   
　b  向前跳转word,光标在word的首位置.   
　e  向后跳转word,光标在word的尾位置.   
　ge 向前跳转word,光标在word的尾位置.   
　0: 移动光标的当前行的第一个字母处.   
　$: 移动光标到当前行的最后一个字母处。   
　G: 移动光标到文档的最后一行。   
　gg: 移动光标到文档的第一行，和1G的功能一样。   
　n<enter>: n是个整数，向下移动光标n行。   
3. 常用命令   
	/word: 从光标处向下搜索下一个字符串”word”。   
	?word: 从光标处向上搜索前一个字符串”word”。找到后，用n跳转到下一个单词，shift-n跳转到上一个单词   
	:n1,n2s/word1/word2/g: n1,n2是整数，用“word2”替换n1-n2行之间的字符串“word1”.   
	:0,$s/word1/word2/g: 用”word2″替换文档中所有的字符串”word1″.   
	x,X : 在一行字中，x为向后删除一个字符(相当于[Del]键)，X为向前删除一个字符(相当于[backspace]即退格键).   
	dd : 删除光标所在的一整行。   
	ndd : n为数字。从光标位置开始，删除向下的n行。   
	yy : 复制光标所在的那一行。   
	nyy : n为数字。复制光标所在的向下n行。   
	p,P : p为将已复制的数字粘贴到光标的下一行，P则为贴在光标上一行。举例来说，当前光标在第20行，且已经复制了10行数据。则按下p后，那10行数据会贴在 原来的20行之后，即由21开始贴。但如果按下P，那么原来的20行会变成30行。   
	u : 复原前一个操作.   
	[ctrl]+r : 重做上一个操作.   
	. : 这是小数点。意思是重复前一个动作。如果重复删除、重复粘贴，按下小数点“.”就可以。   
	i,I : 插入：当前光标所在处插入输入文字，已存在的文字会向后退，其中i为“从当前光标所在处插入”，I为“在当前所在行的第一非空格符处开始插入”。   
	a,A : a为“从当前光标所在的下一处开始插入”，A为“从光标所在行的最后一个字符处开始插入”。   
	o,O : 英文字母o的大小写。o为“在当前光标所在的下一行插入新的一行”；O为“在当前光标所在处的上一行插入新的一行”。   
	r,R : 替换：r会替换光标所在的那一个字符；R会一直替换光标所在的文字，直到按下Esc键为止。   
	Esc : 退出编辑模式，回到一般模式中。   
	:w : 将编辑的数据写入硬盘文件中。   
	:w! : 强行写入。   
	:q : 离开vi。   
	:q! : 若曾修改过文件，又不想存储，使用！为强制离开而不存储文件。   
	:wq : 存储文件后离开，:wq! 强制存储文件并离开。   
	:e!	：重新读取文件。   
	以上30条是vi/vim最常用的命令，随着对vi/vim的了解，你会知道的更多。   
	ctrl-s在windows中的存盘命令会导致在vi中卡死，这时可用ctrl-q取消。   
4. 块选择功能，   
	以下为我机器的hosts文件，如果只想复制IP地址的话就能到块选择功能了。   
	76.13.18.78       farm3.static.flickr.com   
	76.13.18.79       farm5.static.flickr.com   
	128.242.240.29    twitter.com   
	128.242.240.29    www.twitter.com   
	209.85.225.101    docs.google.com   
	74.125.127.100    writely.google.com   
	在普通模式下的块选择按键的意义：   
	v：字符选择，会将光标经过的地方反白选择   
	V：行选择，会将光标经过的行反白选择   
	[ctrl]+v：块选择，可以用长方形的方式来选择数据   
	y：块复制   
	d：块删除   
	列插入：如果想在文档中所有行前面插入某些字符可以这样操作：   
	首先用ctrl-v进入块模式，然后选择想要插入字符的区域，然后使用“shift+i”，此时光标会   
	跳到块中的第一行，然后输入你想要插入的字符，最后按“esc”退出，此时vi就会在所选择的区域中每行加入你想要的字符。   
	合命令举例ggVGy，意思就是先到第一行，然后进入块模式，然后到最后一行，最后复制。可以把以上命令作为一个映射map <C-A> ggVGy 放到用户的.vimrc文件中，这样在vi中就可以使用ctrl-a组合键来复制整个文件了。   
5. 历史命令窗口:   
	方法1：输入q：显示历史命令窗口。q:(注意不是在commond窗口中输入q，而是在普通模式中直接输入q：) 会显示一个命令窗口,显示所有历史命令,用上下键移到相应命令上回车就可执行.   
	方法2：在命令窗口中输入你记得的命令开头几个字符，然后用上下键去查找想要的命令；   
	方法3：在命令窗口中输入“：”，然后用上下键或者ctrl-p（前一个命令），ctrl-n（后一个命令）；   
6. 暂时退出vi:   
	crtl+z   
	返回:fg   
   
7. vi中的参数设置   
	:set xxx 设置xx参数   
	:set noxxx 取消xx参数设置   
	   
	键盘映射   
	调用格式   
	[x]map lhs rhs   
   
	map		在普通和可视，运算符模式下的映射   
	nm		在普通模式下映射   
	vm		在可视模式下映射   
	imap	在插入状态下的映射   
	inoremap在插入状态下非循环映射方式下的映射。no recuision   
	取消映射   
	unmap xx    
   
8. 阅读源文件在文件中跳转:   
	需要查看的文件目录下输入:cscope -bR . 命令,会在当前目录下生成cscope.out文件。   
	在vim配置文件中添加   
	cs add cscope.out   
	set cscopetag语句   
	在文件中跳转的方法：   
	在命令窗口中输入：   
	cs f s abc 查找所有出现abc的地方，此时会出现一个窗口列出所有包括abc的行，输入行号就可以跳转了。   
	cs f g abc 查找abc定义的地方；   
	cs f c abc 查找调用abc的地方；   
	cs f t abc 查找所有包括abc的地方；   
	此外在普通模式下可以将光标移到某个函数上然后键入“ctrl-]”跳转到该函数定义的地方，然后键入“ctrl+t”返回。   
9. 多文件操作: 

	方法1:启动vi时打开多文件:   
	命令:vi file1 file2 ... 在启动时打开多个文件   
	这时打开的文件在一个窗口中,可以用:bn,:bp切换文件,或者使用:n,:prev来切换,但是使用:n有可能到最后一个文件就不能再切换,而用:bn则可以循环切换.   
	方法2:打开文件后在命令窗口中打开:   
	命令:edit  file ,这里输入文件路径,这时就会新开一个文件编辑窗口.   
	使用:new 可以开一个分割新窗口,在这个窗口里输入:q可以退出这个新窗口而不是退出vi.   
	使用:spl(split)或vspl(vsplit) 可以以当前文件打开一个新分割窗口,输入:q可以退出这个新窗口而不是退出vi.   
	当使用分割窗口时,使用ctrl-ww可以在多个分割窗口中切换.   
	当打开多个文件时,可以用ls来显示当前打开的文件名,其中数字后有%a标号的表示当前正在编辑的文件.可以用:bno直接切换文件,no就是ls列出来的文件序号.   
	用wimmanger插件打开   
	用ctrl-w在各个窗口中跳转。   
   

##chmod
- 用途:  
改变文件权限属性

- 调用格式:

		chmod xxx file
- 文件权限解释：  
linux中所有文件（包括目录，设备）都具有权限属性。我们执行ls -l 命令可以看到如下结果：

	    drwxr-xr-x 2 hanhj hanhj  4096 11月 30 09:25 Desktop
	    -rw-rw-r-- 1 hanhj hanhj     4 11月  9 09:15 dic.txt
		lrwxrwxrwx 1 hanhj hanhj    56 11月 30 09:23 si -> /media/big/wine/Program Files/SourceInsight/Insight3.exe
	    。。。
第一列代表文件的用户权限，第三列代表该文件所属的用户，第四列代表该文件所属的用户组。

	- 文件用户权限：  
	例如对于第一个文件Desktop 它的权限是 drwxr-xr-x  
    第一个字母代表文件类型 如果是‘-’代表是普通文件，‘d’代表是目录，‘c’代表是字符型设备（举例串口），‘b’代表是块设备（举例硬盘），‘l’代表符号链接。  
    后面每三个为一组，表示不同分类用户的权限  
    第一组表示文件所属用户的权限，rwx分别代表读、写、执行权限，如果相应位为‘-’代表没有相应的权限。  
    第二组代表文件所属用户组的权限。  
    第三组代表其他用户所具有的权限。  
    **以上权限也可以用数字表示。**   
	用数字标识法，每个文件权限用四个8进制数表示，每个数由4,2,1相加而成，如果对应位省略掉，则设置为0.  
    第一个数代表 suid，sgid权限 。1-代表粘滞位，2代表sgid权限，4代表suid权限。关于suid的说明参见下文。  
 第二个数字代表用户权限 1-代表执行权限，2代表写权限，4代表读权限。  
    第三个数字代表用户组权限，数字含义同上。  
    第四个数字代表其他用户权限，数字含义同上。  
    比如777代表所有用户均具有读写执行权限，755代表用户具有读写执行权限，而用户组和其他用户具有读和执行权限。  


	了解以上知识我们就可以对文件的权限进行改变。   
	如对上面的dict.txt文件执行下面的命令：

		chmod 754 dic.txt 	然后ls -l 显示如下：
		drwxr-xr-x 2 hanhj hanhj  4096 11月 30 09:25 Desktop
		-rwxr-xr-- 1 hanhj hanhj     4 11月  9 09:15 dic.txt
	可见dic.txt文件用户权限加上了执行权限，用户组权限去掉了写权限，加上了执行权限。
	除了用数字改变权限外，还可以用字母改变权限

		u代表用户，g代表用户组，o代表其他用户，a代表全部。
		+代表加上权限，-代表去掉权限。
		r代表读权限，w代表写权限，x代表执行权限，
		X代表当目标文件对用户来说是可执行文件或者是目录时才设置X权限，
		s代表设置set-uid和set-gid权限。s只有和u和g一起使用。

	以上的命令可以用以下方法实现：

		chmod u+x g-w+x dic.txt

- 权限限制：  
	当某个进程访问某个文件时，系统会将启动进程的用户与文件的权限属性相比较。如果用户是文件主，则按照文件主的权限访问。如果用户是文件的组用户，则按照文件组的权限访问，最后如果用户是其他用户，则按照文件的其他用户权限访问。
	
- 目录属性：  
	目录也是一个文件，其中的内容是一个目录项列表。每个目录项包括文件名和一个inode编号。目录的属性：r表示可以打开该目录，w表示可以对该目录添加，删除文件，修改目录名，x表示可以进入该目录  

- 关于sticky属性  
	对于普通文件sticky属性没有用，仅对目录有用。  
	应用场景是对于一个公共目录，该目录的other组应当有rwx权限。但是如果other都有w权限，每个用户就都可以该目录下创建自己的文件，则a用户就可以删除b用户的文件，即使该文件对其他用户是只读属性。为了避免这个问题，该目录的创建者可以加上sticky属性，chmod o+t xx ,这样a用户创建的文件就不能被b用户所删除。反之也一样。但是对于该目录的创建者，仍然可以删除这些文件。   

- 关于suid属性：  
	　　应用场景是对于一个公共文件，如果其中的部分内容仅对a用户开放（可读或可写），另外一部分内容仅对b用户开放（可读或可写），这时可以将文件other组的r权限去掉，即所有其他用户均不能访问该文件。这时只能由特定程序去去访问该文件的时候，由该程序决定哪些用户访问可以访问的内容。这种方法在Linux中称为策略与机制分开策略。  
	　　suid,sgid一般只对二进制程序有用，它的意思是当用户执行此程序时，具有该程序的用户或组身份，而不管此用户原来的身份。利用此特性，当用户执行一个用户id为root的程序时，就具有了root身份,是比较危险的。粘滞位表示当用户第一次执行此程序时，将文件内容留在内存中，这样可以提高下次访问的速度。这个是比较老的用法，现在普遍采用缓存技术，在linux中此位用来表示用户是否对文件所在目录具有权限。举例：  
	　　某个文件a.c,该文件的所有者和组是hanhj。chmod o-r-w-x a.c去掉other的所有权限，这样其他用户就不能使用这个文件。编译一个程序xx打开a.c文件,xx的所有者和组是hanhj。如果对这个程序不加s权限chmod u+s xx ,则当其他用户tom执行这个程序的时候，他的身份是tom，他不能打开a.c文件，因为它属于other组，没有读写a.c文件的权限。但是如果将xx程序加上suid权限，则tom执行这个xx程序的时候就变成hanhj，则它可以打开a.c文件。  

##umask
- 用途：  
用于设置权限掩码。
- 调用格式：

		umask xxx
- 说明：  
	当创建新文件时，新文件的权限就是777-掩码。  
	如：`umask=0002`，则创建新文件夹的权限为777-0002=775，普通文件的权限是666-0002=664（执行权限不用umask来设置，因为此设置会影响系统安全）。

## findmnt 
- 用途：  
	列出当前已经挂载的设备
- options:  
	- -t fs_type

## lsblk
		
- 用途：  
	列出系统中的块设备信息。
- 调用格式:

		lsblk [option] [device]
- 选项：
	- -o UUID 

## blkid
- 用途：  
	显示系统中块设备的名字.常用来已知设备名，需要了解如uuid等信息。
- 调用格式

		blkid options device
- 选项：  
	- -p probe
	- -i info 

## dd
- 用途：  
	文件拷贝和转换命令。
- 调用格式 

		dd if=xxx of=xxx bs=xx count=xx
		如：dd if=/dev/cdrom of=root.iso
- 选项：

	- if：input file  
	- of：output file  
	- bs：bytes copy   
	- count ：how many bs  

##mount:

- 调用格式：

		mount -t 文件类型 挂载设备 挂载点
	举例：mount -t ntfs /dev/sda1 /media/windows  
	将/dev/sda1磁盘分区以ntfs文件类型挂载到/media/windows目录下 
	文件类型：可以从/etc/filesystem或/proc/filesysem文件中看支持哪些文件系统。  
	挂载设备：一般scsi设备是sdxx，ide设备是hdxx，软盘设备是fdxx   
	挂载点：就是需要挂载的文件目录。  
	可以用命令行方式来挂载设备，也可以通过/etc/fstab文件提供的信息来挂载。

- 使用说明

	- 将文件挂载为文件系统  
		有时候需要将某个文件作为文件系统挂载到系统中  

			dd if=/dev/zero of=mnt.img bs=1024k count=1
		产生一个mnt.img文件，大小为1M  

			mkfs -t ext2 -F mnt.img 
		格式化文件,创建文件系统

			mount mnt.img /mnt -o loop
		挂载文件到mnt目录。然后，你可以对这个目录进行操作，举例添加删除文件，最后会反映到mnt.img文件中。

	- 产生一个内存磁盘：
	
			mount -t tmpfs -o size=8M my_ramdis /meida/ramdisk

	- 使用mount命令在在ubuntu下挂载windows的fat32分区的举例:
	
		1. 第一步：修改/etc/fstab
		
				vi /etc/fstab
			相关内容如下：
	
				/dev/sda7 /media/big vfat defaults,utf8,umask=022,nosuid,nodev,uid=1000,gid=1000  0   0
			/dev/sda7  需要挂载的硬盘设备名  
			/media/big   挂载的路径，就是文件存放的地方  
			vfat         文件系统名
	
			以下是配置选项  
			- defaults, 默认配置 属性包括rw, suid, dev, exec, auto, nouser, and async.
			- suid代表允许具有set-uid和set-gid权限，具体suid，sgid的用法参见chmod命令解释。 
			- dev 代表解释字符和块设备。  
			- auto 代表系统起来时是否自动挂载此文件系统。
			- nouser 表示不允许一般用户（如非root用户）挂载此文件系统。
			- async 代表异步操作  
			- utf8,  代表语言编码类型 
			- umask=022 代表所设置的文件系统中文件权限设置（具体umask命令解释）。		- nosuid,  代表不具有set-uid set-gid权限
			- nodev,  代表不解释字符和块设备 
			- uid=1000， 用户id，代表挂载此文件系统后的文件所属的用户。如果不知道uid是多少，可以查看/etc/passwd文件 
			- gid=1000 组用户id，代表挂载此文件系统后的文件所属的用户组。同样的，如果不知道gid是多少，可以查看/etc/passwd文件
			- 0   0   最后两个参数是，第一个被dump命令所用，代表是否需要dump。第二个参数被fsck所用，表示系统起来时fsck的顺序。
		2. 第二步：建目录
			修改好以上参数后，还需要在我们需要挂载文件系统的地方建个目录
				
				mkdir /media/big  
		3. 第三步：挂载
		
				mount -a 
			就可以将windows fat分区按照我们想要的路径和用户名和组挂载上了。
				

##网络共享
- 用途：  
	将网络上的文件在局域网内共享。
- 用samba来共享:

	samba是一种基于smb/cifs协议的提供网络文件共享服务.其客户端被windows,linux所支持。

	配置方法:
	- linux服务端:

		1. 查看是否安装samba服务端软件:

				service smbd status ;
			smbd 是smb daemon 的意思,是samba服务端软件.

			如果没有安装执行:

				sudo apt install samba
		2. 设置配置文件  
			配置文件位于:/etc/samba/smb.conf   
			主要是配置共享的文件夹,举例:

				[share_doc]		网络上共享名
				comment = xxx	注释 
				path=xxx		共享的本地文件
				guest ok = yes/no 是否允许任何人访问,
				如果不允许,则客户端访问时需要提供用户名和密码.(这一点测试的时候反复弹出用户名密码对话框,不知何故)
				read only = yes/no	是否可写
				其他一些选项好像不是必要的
				public=yes/no 
				writeable=yes/no 
				browseable=yes/no 
				create mask=
				directory mask = 
			需要注意的是,由于是共享,所以如果要可写,需要原文件夹对other用户具有写权限,否则即使这里配置了可写,也不能写入.
		3. 启动服务端:

				sudo /etc/init.d/smbd start	或
				service smbd start 	或
				sysvc-rc-conf来配置自动启动
	- windows端服务器:  
		配置用右键点取需要共享的文件夹,然后选择共享,是否允许修改即可.
	- 客户端:
		- 在windows的文件夹浏览

			在windows文件浏览器中输入\\\\server_ip就可以看到共享的文件内容.如：

				\\192.168.0.103  
		- 在liunx的文件夹浏览器浏览

			在linux文件夹浏览器中输入smb://server_ip,如:

				smb://192.168.0.103/  
		- 在linux中挂载该文件系统

			可以用mount命令,如:  
			mount -t smbfs/cifs //server_ip/share_name mount_point -o user=xxx,pass=xxx,[uid=xxx,gid=xxx,file_mode=xxx,dir_mod=xxx,noserverino,vers=1.0]  
			带[]中的内容是可选项,vers选项主要是因为有些老的windows系统不支持smb2.0以上版本.  
			如:mount -t cifs //192.168.0.102/share_doc share_doc -o user=hanhj,pass=hanhjhanhj,uid=1000,gid=1000,noserverino,vers=1.0

- 用nfs来共享

	nfs是sun公司在1984年发明的一种网络共享协议(internet filesystem).目前有nfs2,3,4版本.

	配置方法:
	- 服务器端：
		1. 查看是否安装服务端软件

				dpkg -l nfs-server-kernel
				dpkg -l nfs-common
				dpkg -l rpcbind
				or
				service rpcbind status
				service nfs-server-kernel status
				如果没有安装,执行:
				apt install nfs-kernel-server
				apt install nfs-common
				apt install rpcbind
		2. 配置/etc/exports文件：  
			文件中每一行描述一个共享的目录，其内容为  	
			文件格式:共享的目录 允许的共享者(共享的属性)。如：

				/media/work/share_doc *(rw,sync,no_root_squash)

			共享属性：

				rw 
				ro 
				no_root_squash，不将root身份改成匿名身份
				root_squash,将root身份改成匿名身份。
				all_squash,所有访问者改成匿名身份
				anonuid,设定匿名用户权限，将匿名用户的权限改成后面设置的uid或gid权限。
				sync，同步到硬盘
				async，同步到内存
			在nfs中没有验证机制，当访问者在服务端的用户列表中(/etc/passwd），则访问者具有服务器同名用户权限。

			如果访问者id与服务器用户列表id相同，则访问者具有同名id权限。

			如果访问者不在服务器用户列表中，则有匿名用户权限（即nobody）

			如果访问者以root用户身份登录，则默认是将root身份改成匿名用户身份。
			设置好exports文件后，用exportfs命令来更新

				exportfs 
					-r :更新 
					-a :所有
					-u :卸载 
					-v :显示过程。
		3. 启动nfs服务 

				sudo /etc/init.d/nfs-kernel-server start	or
				service nfs-kernel-server start 
	- 客户端:

		通过mount命令来挂载:

			mount -t nfs server_ip:/share_name mount_point [action] [-o options]
			举例:mount -t nfs 192.168.0.103:/meida/work/share_doc share_doc -o nolock 
			action:
				-r
				-w
			options:
				nolock		:文件锁,挂开发板的时候有用,具体还不明白.
				proto=xx	:tcp/udp 
				rsize=xx	:
				wsize=xx	:

		shomount 命令可以查看服务端或客户端的共享情况
		在开发板上挂载时需要加上-nolock

			mount -t nfs ip/dir mount_dir -o nolock 
			举例 mount -t nfs 192.168.15.23 /mnt/tmp -o nolock ,intr,rsize=1024,wsize=1024 
	
## tftp
- 用途:  
	通过TFTP协议传输文件

- 服务器：    
	1. 启动服务器：

			sudo /etc/init.d/tftpd-hpa start
	2. 配置文件：

			/etc/default/tftpd-hpa 
- 客户端： 
	- 下载文件:

			tftp ip -g -r file
			ex：tftp 192.168.15.62 -g -r xxd 
	- 上传文件：	

			tftp ip -p -l file
			
##ls
			
- 用途：  
	显示目录内容
- 调用格式：

		ls [options] [file]
- 选项：  
	- 输出格式选项：  
		- -l	:长格式，显示详细信息
		- -1	：单列，输出每个文件后即换行。普通方式下多个文件在一行中。
		- -R	:递归 
		- -a  :显示所有包括隐含文件
		- -A  :显示除. .. 隐含文件外的文件,同ls 
		- -d  :仅显示目录
		- -F  :文件后追加标识符 /表示目录,@表示符号链接,|表示管道符,=表示socket套接字,* 表示可执行文件.
		- -s	:关于文件大小的输出  
			- -s	：输出文件占磁盘大小（块数）。
		 	- -sh	：文件大小的单位可以自动调整成k，m，g等。human  
				文件大小单位：默认按照1k=1024.
			- -si	：按照1k=1000 
	- 时间选项：
		- --time=word，与-l选项连用   
			word可以是:    
				atime：	accesstime;  
				ctime：	changtime  
		 		默认的是modifytime  
		- -u	：显示accesstime，并且按照最新时间排序
		- -c	：显示changetime，并且按照最新时间排序
	- 排序选项：  
		- -t	:按照修改时间输出并排序，最新时间在前。  
				如果与-u选项连用，按照accesstime输出并排序。  
				如果与-c选项连用，按照changetime输出并排序。
		- -S	：按照文件大小排序，大的在前。
		- --sort=word，按照word来排序  
		 		word=
		 			size,	等同-S  
		 			time，	等同-t  
		 			verion，	等同-v  
		 			extension	等同-X   
		- -r	：反序


- 关于文件时间的说明：  
	首先要定义三个名词：访问（access），修改(modify)，改动(change)  
	访问：读取文件  
	修改：对文件内容进行修改。  
	改动：包括对文件内容进行修改，以及对文件权限，所有者等文件信息进行修改。  	
	linux中对于文件有三个时间：  
	- access time:	访问时间，确切的说是对文件进行修改或改动后，对文件内容首次访问的时间。  

	> 需要解释一下：如对文件a内容修改并保存后，三个时间都会改动。如果修改或改动后该文件一直未被访问，则该时间不会被改动，直到有一次访问该文件，该时间将被改动，之后只要文件不被修改或改动，无论访问多少次都不会g改这个时间。

	- modify time:	对文件内容进行修改的时间。  
	- change time:	对文件内容进行修改或对文件权限，所有者信息进行改动即上述的进行“改动”的时间。 

	通过touch可以改变以上时间：  
	touch -a file :	改变文件访问时间和改动时间  
	touch -m file:	改变文件修改时间和改动时间  
	touch file	:	改变文件上述三个时间  

ls -d */ 仅显示当前目录下的目录

##basename:
- 用途：显示路径中最后的部分
- 调用格式：

		basename dir [suffix]
如果有suffix，表示去掉后缀名 

##dirname
- 用途:显示路径中最后部分前面的路径

##realpath
- 用途:显示路径的实际物理路径，将链接转换成实际的物理路径

##cp 
- 用途： 
	复制文件
- 调用格式:
	
		cp [选项] [参数]

- 选项:  
	- -a 同-dpR,保持源文件的结构和属性
	- -b 当目标文件存在时,在覆盖前为其创建一个备份.
	- -d 如果复制的源文件是符号链接,则仅复制符号链接本身.
	- -p 保持源文件的所有者,权限,时间属性.
	- -R或-r 递归复制所有子目录
	- -i 如果目标文件存在,在覆盖前提示用户.默认情况下Linux环境都有别名 cp cp -i
	- -l 创建源文件的硬符号链接,同ln
	- -s  创建源文件的符号链接,同ln -s
	- -u 仅当源文件比目标文件新或者目标文件不存在的时候才复制.
	- -v 详细显示命令的执行操作.
	- 扩展:
	- linux环境中许多命令的选项具有相同的意义,举例
	-    -i 表示提示用户
	- -v 表示显示详细过程
	- -R 表示递归
	- -f 表示不提示用户
	
##scp 
- 用途  
	远程复制文件
- 调用格式 

		cp src_file dest_file
		xample scp hanhj@192.168.15.23:/home/hanhj/.vimrc .

##mv 
- 用途：  
	移动文件

- 调用格式:

		mv [选项] [参数]
- 选项:  
	- -i 同cp
	- -f 同cp
	- -u 同cp
	- -b 同cp
	- -v 同cp
	

##pwd 
- 用途  
	打印当前工作目录
- 调用格式：

		pwd [options]
- 选项  

	- -v 同cp
	- -P 显示绝对路径 

##df   
- 用途：  
	显示当前磁盘使用情况
- 调用格式：
	
		df [options]
- 选项  
	- -h 按照人可阅读显示

##du 
- 用途  
	显示目录占用磁盘情况
- 调用格式：

		du [options]

- 选项  
	- -b 按照byte统计
	- -k 按照k统计
	- -m 按照M统计
	- -B 按照指定大小统计
	- -c 统计总量

##who  
- 用途
	显示当前用户
- 调用格式：

		who [options]
- 选项  
	- -r 显示当前运行级别


##sudo 
- 用途   
	以超级用户身份运行
- 调用格式

		sudo [options]]  命令 
- 选项：  
	- -H 以用户的根目录设置环境变量
	- -i 以root身份登录并运行
	- -l 列出用户可运行命令
	- -u user 以user身份运行
- 说明： 
文件/etc/sudoers:sudoers用来配置sudo用户，文件内容如下：

		# Host alias specification
		用来配置主机别名，方便配置主机
		
		# User alias specification
		用户别名，方便配置用户
		
		# Cmnd alias specification
		命令别名，方便配置命令
		
		# User privilege specification
		root	ALL=(ALL:ALL) ALL
		hantmp	ALL=(ALL:ALL) ALL
		用户配置：
			规则是：用户 主机=(目标用户) 命令
			举例上面的命令表示 接受来自各种主机的hantmp用户，其目标用户为所有，可以执行各种命令。
		
		# Members of the admin group may gain root privileges
		%admin ALL=(ALL) ALL
	
##rm
- 用途  
	删除文件  
- 调用格式:

		rm [选项] [参数]
- 选项:  
	- -f 同cp
	- -i 同cp
	- -R/-r 同cp
	- -v 同cp
	

##rmdir 
- 用途  
	删除空目录
- 调用格式:

		rmdir [选项] [参数]
- 选项:

	- -p 递归删除所有父目录 parent
　　- -v 同cp

- 说明:  
	rmdir只能删除空目录,如果目录不为空则报错.  
	当使用-p选项的时候,输入的参数必须是最后一级.


##chgrp   
- 用途:改变文件所属组
- 调用格式:

		chgrp [options] group file 
- 选项:  
	- -f 不显示报错信息
	- -R 递归调用
	- -v 显示过程
	
- 说明:  
	 类似的命令chown


##chown  
- 用途:改变文件所属组和用户
- 调用格式:

		chown group:user file 

- 选项:   
	- -f 同chgrp
	- -R 同chgrp
	- -v 同chgrp
	
- 说明：  
	如果只提供用户名,用户组不改变,如果同时提供用户名和组,之间用冒号或者点隔开.

##用户设置

用户信息保存在/etc/passwd中   
用户组信息保存在/etc/group中  

- 用户   
	- useradd增加用户  
		- -m 会在home目录下添加用户的目录  
		- -g gid 设置用户组号  
		- -u uid 设置用户号  
		默认的会添加与用户名相同的用户组。  
	
	- adduser 增加用户	
	- deluser 删除用户  
		- --remove-home删除home目录下的用户目录  
	- usermod 修改用户信息，包括密码，  
		但是最好不要用此命令修改密码，因为会导致影子文件中的密码是明文。/etc/shadow  
	- passwd 用来修改用户密码  
		- -l 锁定用户，即禁止用户
		- -u 解锁用户  
		通过usermod -L/U可以同样达到此目的
- 组用户  
	直接查看/etc/group文件，可以看到组成员情况。  
	- groupadd 添加用户组  
		- 调用格式：
				
				groupadd [options] group
		- options 
			- -g gid 设置用户组号
	- groupmod 修改用户组
	- groupdel 删除用户组
	- gpasswd 组用户操作
		- 调用格式  

				gpasswd [options] user group
		- options  
			- -a 添加用户到组中
			- -d 从组中删除用户
	
##find 
- 用途:查找文件
- 调用格式:

		find options expression  action
	find中的expression可以包括文件名，可以使用*,?,[]等文件通配符，但是为了防止shell首先将其展开，需要将其用‘’将其括起来。否则将出现意外的结果。
- options:  
	- -xdev	排除非本文件系统文件
	- 	-mount	同-xdev
- expression:  
	- +n	greater n
	- -n  less n
	- n	equal n
	- -name 指定文件名
	- -gid  查找指定用户组id中的文件
	- -uid  查找指定用户名id中的文件
	- -group查找指定用户组中文件
	- -user 查找指定用户名中的文件
	- -path 指定路径
	- -prune 如果没有给出-depth（表示先处理目录中文件，再处理目录），则不进入当前目录。如果给出-depth则返回false，没有效果。
	- -amin 查找指定分钟前访问过的文件。
	- 	注意：这里所说的指定分钟前是指第n分钟前，是指查找n分钟到n+1分钟之间所修改的文件，如果访问时间在n+1分钟之前就不会找到。如果想找n分钟之前访问的文件应当在n前面加+。下面关于时间的查找情况一样。
	- -atime 查找指定天数,或前（+），或内（-）访问过的文件.举例:find . -atime +3,查找3天前访问过的文件
	- -cmin 查找指定分钟,或前（+），或内（-）改变文件状态的文件
	- -ctime 查找指定天数,或前（+），或内（-）改变文件状态的文件
	- -mmin 查找指定分钟,或前（+），或内（-）修改文件内容的文件
	- -mtime 查找指定天数,或前（+），或内（-）修改文件内容的文件
	- -a/c/mnewer file 时间与file比较 
	- -size 按照size比较 
	- -maxdepth 查找深度
- logic of expression:
	- expr1 -o expr2	:or logic
	- expr1 -or expr2	:or logic
	- expr1 expr2		:and logic 
	- expr1 -a expr2	:and logic
	- ! expr			:not logic
	- -nor expr		:not logic 
	- \( exp1 \) , \( exp2 \) 执行exp1 和 exp2 
- action:
	- -print	默认动作，打印查找出来的文件。
	- -exec 指令 {} \; 对于find输出的结果执行-exec指定的指令,执行指令前会提示.`{}`表示前面输出的结果，注意最后要加上`\;`.在;前面加上转义符\的意思是由于;在bash中解释成命令的结尾，如果不加转义符，该find命令就将结束。而在find命令中可以有多个执行语句，所以要避免解释成find命令结尾。  
	举例：显示找出的文件内容：`find . -name "app" -print -exec cat {} \;`  
	注意要加上print选项，否则不显示文件名，不好区分。  
	多个执行语句：	find / -ctime +30 -a \( -name '.vimrc' -o -name 'vimrc' \) -exec grep -n 'mmap' {} \; -exec echo {} \;  
	在根目录下查找30天前修改.vimrc或vimrc文件，然后查找其中包括nmap的行，同时打印该文件名。 
	- -ok 指令{} \; 对于find输出的结果执行-ok指定的指令,执行指令没有提示. 

- 说明:
	- 查找除某个目录下的文件

			find . -path xx -prune -o -print
	- 排除多个目录，查找某个文件

　　		 find . \( -path ./tmp -o -path ./dsp/bak \) -prune -o  -name "*.c" -o -name "*.cpp" -o -name "*.h" 
		　　 prune：修剪的意思

## xargs
- 用途 用于在程序后面添加参数。
- 调用格式：  
	默认的xagrs用标准输入作为输入。	举例：
		
		find / -name  'vimrc' -print | xagrs grep -n 'local'; 
	将find的输出文件名作为grep的输入，这样grep命令可以只执行一次。  
	同样的功能可以用find / -name 'vimrc' -exec grep -n 'local' {} \;来做，但是这样每次找到一个文件就要调用grep，效率较低。  
	xargs自动填充输入参数缓冲区可以达到128k，如果多于128k就将参数分割调用程序。这样可以防止直接调用参数缓冲区过小导致程序不能执行的问题。举例：

		ls *.dat|cat ,
	如果dat文件过多，可能导致cat命令的缓冲区溢出，这时可用`ls *.dat|xargs cat`

##ln 
- 用途:创建链接
- 调用格式:

		 ln 源文件 链接文件.
　　 默认是创建硬链接,所谓'硬链接'就是两个文件具有相同的inode,创建硬链接的文件必须与源文件在同一分区中.不能为文件夹创建硬链接.
- 选项:  
	- -f 强制覆盖
	- -i 提示
	- -s 创建符号链接,符号链接仅仅是一个符号,相当于windows中的"快捷方式"
	- -v 显示过程

##mkdir 
- 用途:创建目录
- 调用格式

		 mkdir 目录名
- 选项:
	- -p  可以创建中间缺少的目录
	- -m 可以设置目录属性,默认的是根据umask来设置属性.
	- -v 显示过程
	
##which,whereis 
- 用途：查找指令的二进制程序,man手册,源代码在磁盘中的位置
- 调用格式:

		which xx
- 选项:
	- -b 查找二进制
	- -m 查找man
	- -s 查找src
	
##tar
- 用途：压缩文件	
- 调用格式:

		tar [options] [zipfiles] [files]
- 选项：
	- -c	代表压缩
	- -x	代表解压
	- -v	代表显示过程
	- -t  显示压缩文件中的内容
	- -f	代表文件
	- -z	代表gzip格式
	- -j	代表gzip2格式。如果不知道文件的压缩格式，可以先用file命令来显示文件格式。
	- -J	代表xz格式
	- -C	代表改变解压目录。

举例：    
压缩文件：

	tar -czvf xx.tar.gz /tmp 
	tar -cjvf xx.tar.gz2 /tmp
解压文件：

	tar -xzvf xx.tar.gz -C /tmp
	tar -xjvf xx.tar.gz2 -C /tmp

##zip
- 用途：压缩文件	
- 调用格式:

		zip [options] zipfile files
- 选项：
	- -r	recurse
	- -d	删除文件
	- -v	显示操作过程
	
##unzip
- 用途：解压缩文件	
- 调用格式:

		unzip [options] zipfile 
- 选项：	
	- -l	list files 
	- -d  改变输出目录
	- -v	显示操作过程

##gzip
- 用途：压缩文件	
- 调用格式:

		gzip [options] file 
		gunzip [options] file.gz 
		zcat file.gz 
- 选项：
	- -d 解压 
	- -l 列出压缩比等压缩文件信息
	- -c 改变输出为标准输出.
		gzip默认在file压缩后，将在原文件后面加上后缀.gz以替换原文件。为了保留原文件可以gzip -c file > file.gz.注意后面要加上>file.gz,否则gzip将压缩结果输出到屏幕上，会出现乱码。如果想压缩多个文件可以gzip -c a.txt b.txt >file.gz 
		zcat可以显示压缩后的文件内容，相当于gunzip -c file.gz 

##rar
- 用途：压缩文件	
- 调用格式:

		rar <action> [options] rarfile [files] [path_to_extract]
- action：
	- a	压缩文件
	- l	显示压缩文件
	- x	解压文件
	- d	删除文件
	- c	为压缩包添加注释。ctrl-d退出
	- v   显示过程
- 选项：
		-r recurse

##	unrar
- 用途：解压缩文件	
- 调用格式：

		unrar <action> [options] rarfile [path_to_extract]
- action:  
	- e	解压到当前目录
	- x	解压全目录
	- l   列出压缩文件内容
	如果用x，则path_to_exotract必须先存在

##压缩总结

	.suffix			压缩					解压
	.gz				gzip files				gzip -d/gunzip zipfile
	.bz2			bzip2 files				bzip2 -d/bunzip2 zipfile
	.tar			tar -cf zipfile files	tar -xf zipfile
	.tar.gz/.tgz	tar -czf zipfile files	tar -xzf zipfile
	.tar.bz2		tar -cjf zipfile files	tar -xjf zipfile
	.rar			rar a zipfile files		unrar x zipfile [-d]
	.zip			zip zipfile files		unzip zipfile [-d] 

##updatedb　
- 用途 更新搜索文件数据库  
相关配置文件为/etc/updatedb.conf

##locate
- 用途 搜索文件  
与updatedb关联，默认是从 var/lib/mlocate/mlocate.db中查找文件。
- 调用格式 
	
	locate [options] pattern
- 选项  
	- -b basename.match only basename

##dirname
- 用途：获取路径名

##basename
- 用途:获取除去路径的文件名
- 调用格式：

		basename filename [suffix]
	如果跟suffix则去掉文件后缀名。	
	

##rename
- 用途: 批量修改文件名
- 调用格式：  

		rename [options] regular  files
	使用perl正则表达式来更名文件
- 举例：

		有文件abc.txt abc1.txt abcf.txt,  
		如果想把a替换替换成m，可以输入：rename 's/a/m/' *.txt 


##file 
- 用途:检测文件类型
- 调用格式

	file [options] files 
- 选项:

	- -f  用输入的文件来检查

##touch 
- 用途:改变文件时间
- 调用格式:

		touch 文件,
	默认使用当前时间作为文件最后访问时间和修改时间
- 选项:
	- -t [CCYY]MMDDHHmm[.ss],指定时间
	- -a  <时间> 仅修改最后访问时间
	- -m  <时间> 仅修改修改时间
	使用touch命令可以创建新文件. touch newfile
	
##time
- 用途： 统计程序运行时间
- 调用格式
		
		time program
- 选项：
	- -p 按照可移植格式显示

- 举例：

		time -p grep hello . -r  --include "*.h" >/dev/null
	结果：

		real xx 程序实际执行时间，与当前系统执行任务有关
		user xx  用户指令执行时间
		sys  xx  系统指令执行时间（调用内核）
	
##date
- 用途：显示时间		
- 调用格式：

		date [options] +FORMAT
- 选项：
	- -d str	按照str中指定的时间显示。  
		举例：date -d '2019-1-1'
	- -s str  按照str中指定的时间设置时间。

	FORMAT用来格式化输出时间格式

			%Y	年
			%y	两位数的年
			%m	月
			%d	日
			%H	时
			%M	分
			%S	秒
			%w  周几，用数字表示。
			%W  年中的第几周
			%a	周几，用缩写的英文表示
			%A	周几，用全写的英文表示
	

##ps：
- 用途 显示当前进程
- 选项：
	- -e	显示全部进程
	- -all	显示详细内容

##set：
- 用途 查看本地定义的变量


##unset 
- 用途：取消变量
- 调用格式：

		unset xx 

##env  
- 用途：显示所有环境变量


##export
- 用途：将变量设置为环境变量
- 调用格式

		export var=xx 
	　　export增加的环境变量是临时的,关机后就没有了.
　　	在/etc/profile下面定义永久的环境变量.其他可以设置永久环境变量的地方：/etc/profile.d,/etc/bash.bashrc，~/.bashrc,~/.profile

##source：
- 用途：在当前bash中执行脚本。

	在bash中启动一个程序时，bash一般会启动一个新的bash，然后再新的bash中执行该程序。在新的bash中会继承父bash的环境变量，但是不会继承临时变量。子bash中可以设置环境变量，但是退出时，此环境变量丢失，不会影响父bash。  
	如果用source来执行程序，则bash会在当前bash中执行程序，所以在程序中如果设置环境变量，则当前环境中的环境变量将发生改变。

##regular expression正则表达式

正则表达式可以灵活处理字符串,最初用于sed和grep，称为regex，后来pythom，java等开发语言也支持了正则表达式。  
注意不要与shell中的文件通配符混了。在shell中用*来匹配任意字符的字符串,用?来匹配一个字符。  
举例：ls *.txt。在这里，shell首先解释命令中的文件通配符，并将其展开，与这里将的正则表达式是不同的。  

正则表达式中的元字符：

- 基本元字符  

		. * [ \ ^ $  
- 扩展元字符

		? + { | ( ) < >  

- 基本元字符解释：  

		.	可以匹配1个任何单字符  
		*	匹配其前面字符的0次到多次，比如12*4,表示匹配2的0次到多次，如1224，12224,14都能匹配。  
		[	表示一个字符集合开始  
		\	表示转义其后的控制字符  
		^	表示开头  
		$	表示结尾  
		[-] 表示一个字符集合，在这个集合中除非在特殊位置，控制字符是其原义。  
			- 字符，表示范围  
			在字符集合中用-在两个字符之间，表示字符的一个范围。例如[a-z],表示a-z的字符集合。如果想匹配-，则应当将其放在最后。  
		^   表示取补集  
			^如果在[的开头，表示与字符集合之外的字符匹配。比如[^a-z]，则匹配任何非小写字母。如果想匹配^则应当将其放在不是第一个字符的位置。  
		]   表示匹配集合结束。  
			如果想匹配]，应当将其放在第一个位置。  

- 扩展元字符解释：  

		() 表示分组，()中的字符是一个字符串，表示匹配这个字符串。
		比如(xas)，表示匹配xas。使用()做组匹配时，如果匹配上可以用\1,\2..表示前面的组字符串，这在输出时往往有用。
		|	表示逻辑或的关系。比如[ae]\|[bd]，表示匹配ae或者bd。或关系比较特殊只有在egrep中可以使用。  
		+   表示匹配前面字符1次到多次。比如a+,表示匹配a至少一次。  
		?	表示匹配前面字符0次到1次。比如a?,表示匹配a 0次或1次  
		{}	{m,n},表示匹配至少m次，至多n次。比如a{3,4},表示匹配a至少3次，至多4次。  
		<>	表示精确匹配	  
			
以上控制字符如果在基本regex中使用时，需要在前面加上转义符\，即将普通字符转义成控制字符。例如`grep 'a\+' `,`grep 'a\{3\}'` 。在扩展grep中转义符可以加也可以不加(grep -e,or egrep)。  

- 预定义的字符集合  
	[: ... :]形式的预定义字符集合  
	[:alnum:],表示字母和数字  
	[:alpha:],表示字母   
	[:digit:],表示数字 0-9  
	[:xdigit:],表示十六进制的数字0-9,a-f，A-F   
	...  
	更多参见man awk   
	在grep中使用这些预定义字符集合需要在前面加上[],比如  

		grep [[:alpha:]] xx   
	以\\开头的预定义字符：  

		\w	a word  
		\W	non word   
		\s	blank  
		\S	non blank  
		...  
		不同的程序对此定义不同，上面几个比较通用。  
		具体程序参见其man手册。  

vim的参见:h regular   

##grep
- 用途:查找字串
- 调用格式：

		grep [options] pattern [dir] files
		没有dir，默认是当前目录
- 选项：  
	- -i 忽略大小写
	- -w 匹配整个单词
	- -x 匹配一行
	- -r 在路径中递归查找
	- -R 在路径中递归查找，包括链接
	- -n 显示行号
	- -v 反向匹配
	- --include=pattern 包括展开的文件名
	- --exclude=pattern 不包括展开的文件名
	- --exclude-dir=dir 不包括路径
	- -A num ,显示匹配行前面的num行
	- -B num ,显示匹配行之后的num行
	- -C num,显示匹配行前后的num行 
	- -o pattern 仅显示匹配的字符
- 说明：

	比如想查找当前目录下包括子目录中的c，cpp文件中包括return 0;语句的部分。  
	`grep "return 0" . -r  *.cpp *.c` 会在子目录中查找所有文件，而不是cpp，c文件。因为首先是shell展开当前目录的cpp，c文件，然后对当前目录进行递归查找，此时就不会仅仅包括cpp和c文件。  
	所以应当为：`grep "return 0"	. -r --include=*.cpp --include=*.h`  
	如果想以其他目录搜索，应当加上-r：  
	`grep "return 0" dir -r --include=*.cpp --include=*.h`  
	
##| 管道
	将前一个程序的标准输出作为下一个程序的标准输入
	linux中的许多程序将标准输入（比如控制台的键盘）作为输入。其输出为标准输出（比如控制台的屏幕）。管道即将二者连接起来。
	举例：
		 set | grep ...
	　　 grep可以使用正则表达式。如果想获得逻辑与的结果，举例查看某个文件中包括“字串1”和“字串2”的内容的行： 
	　　`cat search.txt|grep "xxxx1"|grep "xxxx2"`

		
##sed  流编辑器 stream edit for filtering and transform text
- 用途：sed用于对输入的文本逐行处理。  
sed不会改变源内容，除非特地指定。sed输出到标准输出。
- 调用格式：

		sed [选项] '脚本命令' inputfile
- 选项：  
	- -e 执行后面的脚本命令，如果有多个脚本命令，可以用-e 隔开。
	- -f 脚本文件
	- -i 修改源文件
	- -n quiet 不显示自动匹配的字串
- 脚本命令：
	- 格式：[地址]动作  

		动作分为无地址动作，无地址或只有1个地址的动作，有地址范围的动作。
	- 地址：指明范围。  

		地址可以是用数字，也可用匹配来产生。
		- $	表示最后一行。（正则表达式中的$表示一行的行尾位置）
		- n1,n2	范围从n1行到n2行
		- n1,+N	范围从n1到后面N行
		- n1,~N	范围从n1间隔N行
		 	举例`sed '1,~2p'`,则打印奇数行
		- /pattern/ 匹配字串地址

			如果地址后跟!则表示地址范围是以上地址取反。
	- 动作：当匹配上的时候的动作

		- 无地址动作：

				: label 做标记?
				#comment 注释
		- 无地址或只有一个地址的动作：

				=		打印行号
				i text 在地址前插入文本
				a text 在地址后插入文本
				r file 在地址后插入文本
				R file 在地址后插入文本，并对每一行解释执行。？
		- 地址范围的动作：

				p		打印当前行
				c text 将选定行替换成text。(整行替换)
				d		删除选定行
				s/pattern/repleace/	将匹配的部分替换成replace
				y/source/dest/		将source中出现的字符，替换成dest中的对应字符。要求source和dest必须等长。
				w file	将选定部分写到文件中。
- 举例：

	删除空行：`sed '/^$/d' demo.txt`  
	行尾添加内容：`sed 's/$/append/' demo.txt`  
	行尾删除刚才添加的内容：`sed 's/append$//' demo.txt`  
	大小写转换 `sed 's/[a-z]/\u&/g' demo.txt`,`sed 's/[A-Z]/\l&/g' demo.txt`  
	注意：\d,\u,\l,不能用在正则表达式的匹配中，只能用在转换中，如果在匹配中只能是字母本身。

##awk
- 用途：
	awk是另一个类似于sed的行文本处理程序。  
	awk的原理是逐行读入文本，按照定义好的分割符将文本切割成多列，然后通过类似于c的脚本进行处理。awk认为输入的文本是结构的，可以分割成多列。sed只能提供内定的一些处理命令，而awk可以通过编程来实现比较复杂的处理。

	awk是符合PROSIX 1003.1标准的语言。gawk程序来自论文：AWK Programing Language，由Aho,Kemighan和Weinberger完成。
- 调用格式：

		awk [-v var=value] [-F value] [-f program-file] 'program text' [file ...]。
- 选项 		
	- -f program-file	：输入的awk脚本文件
	- -F ：定义分隔符
		awk -F '/'
		分隔符也可以在BEGIN中来定义。举例{BEGIN{FS="/"}}
	- -v val=value ：设置变量.可以被BEGIN所识别  
		可以给awk输入参数，在awk中可以直接引用输入参数，
		举例
		1)awk -v OFS="." 'BEGIN{print OFS}' test.txt
		2)awk -v OFS="." -f test.awk test.txt
- program text：
	
	- 格式：pattern {action}

		如果没有匹配，则默认是匹配每一行
		如果没有动作，则默认动作是print
		不能既没有匹配也没有动作。

		- pattern：  
			BEGIN	：表示在读取文件前的动作  
			END		：表示在读取文件后的动作  
			/regular/：正则表达式

			> 正则表达式与一般的正则表达式使用方法一致。需要说明的是awk支持扩展正则表达式。举例:[:alnum:],[:alpha:],等  

			relation expression	：关系表达式  

			> 关系表达式可以用在下面动作一节中所有定义的操作。通常用作测试特定字段与特定正则表达式是否匹配。

				pattern && pattern：	逻辑与 
				pattern || pattern：	逻辑或
				pattern?pattern:pattern
		- action：
				action就像c语言一样。 
				在awk中action需要用`'{}'`来包括。 
				如果`{}`中的操作含有更多的操作，可以再次嵌套。 
				动作之间用;分隔。  
				动作包括：
				
				(...)	：分组  
				+-×/%
				++，-- 
				！
				<,>,=,!=,==
				~,!~	：正则表达式的比较
				&&，||
				|		：管道
				in		:array的操作
				print exp
				printf format,expr..
				...other fun 
				在awk中执行shell命令：
					1）awk '{print|"command"'
						awk '{print|"ls"}'
					2) awk '{system("command")}'
						awk '{system("ls")}'
						awk '{v1="echo";v2="abc";system(v1" "v2)}'
				special filenames
				/dev/stdin or 1
				/dev/stdout or 2	
					print "something" > /dev/stderr 
					or
					print "something" | "cat 1>&2""
				/dev/fd/n

- 内部变量：

		$0	代表整行
		$1	代表分隔的第1列数据
		$2	代表分隔的第2列数据
		...
		NF 表示每行的单元数
		NR 表示文件的行数
		FS 表示列分隔符，默认是空格
		OFS 表示输出列分隔符，默认是空格
		RS 表示记录分隔符，默认是换行符
		ORS 表示输出记录分隔符，默认是换行符
		...
		注意：如果修改了输入分隔符，则相应的输出分隔符也要修改，否则分隔符就是默认的。
- 变量：
定义变量：

		var=varl
		变量不需要象c语言需要预先定义，也没有类型区分。
		这个定义可以在命令行中，也可以在脚本中。如果在命令行中，则此变量只有在命令执行的时候才生效，而在BEGIN中不会生效，除非用-v var=varl来定义。	
	引用变量：
		就像c语言中一样，直接使用。不需要向shell中需要用$var来引用。
	数组：
		数组用[]来表示，awk可以自动扩展。举例：
			a[1]=1;a[2]=2...
- 函数：

	- split(s,A,r):将字串分割。
		s:源字串，r:正则分割符，A：分割后字串
		awk 'BEGIN{s="a/b/c";split(s,A,'/');OFS="-";print A[1],A[2],A[3];}'
		结果是：a-b-c
	- gsub(r,t,[s]):全局替换  
		r：正则匹配字串，t：匹配后替换字串，s:源字串，如果没有，默认是$0
		echo aaa2017|awk '{gsub(/[0-9]+/,"bbb")'
	- sub(r,s,t):
		类似与sub，只是将t中第一次出现的r用s替换
		awk 'BEGIN{t="abc";sub("a","s",t);print t}'
	- inedx(t,s):
		返回t中s所处的位置
	- length(s):
		返回s的长度
	- substr(t,pos):
		返回t中从pos之后的字串  
	- substr(t,pos,len):
		返回t中从pos之后长度为len的字串。  
		pos,len是数字,与index正好相反。	  
	- match(s,r):
		返回r在s中的位置。r是正则表达式。失败返回0
		如果返回匹配字串，可以用：substr(s,match(s,r))  
	更多函数参见man awk 

## 关于条件组合的总结：
逻辑与逻辑或的关系在多个地方都会用到，但是有些区别。
假设a=1,b=3

-	c语言中的逻辑：
	
		|,||,&,&&
		|	:或操作：	if(a>1|b>3) 
		&	:与操作：	if(a>1&b>3) 
		||	:逻辑或：	if((a>1)||(b>3))	:先判断前面一个逻辑，如果前面一个逻辑真,则不判断后面一个逻辑。
		&&	:逻辑与：	if((a>1)&&(b>3))	:先判断前面一个逻辑，如果前面一个逻辑假,则不判断后面一个逻辑。
	
-	awk中的逻辑:
	
		||	:逻辑或	
	
	awk与c语言非常类似，但是awk中没有或操作，与操作 ，像if(a>1|b>3)的操作是不被允许。而if(a>1||b>3)是被允许的。
	
-	makefile中的逻辑：
	
		ifeq	：makeifle中比较简单，只有ifeq逻辑等：
		ifeq(expr1,expr2)
	
-	正则表达式中的逻辑：
	
		|	:逻辑或。举例：[a-z\|1-9]
	
-	shell中的逻辑:
	
		-and
		-or ...
	在shell中|代表管道，&代表后台。不能直接使用  
	除非在expr程序中，在脚本命令中只使用||，&&，或-or(-o)，-and(-a)。
	举例：					  
	
		if [ $a -gt 1 -o $b -gt 3 ];then	:逻辑或,-o 代表-or 
		if [ $a -gt 1 -a $b -gt 3 ];then	:逻辑与,-a 代表-and 
		if ((a>1||b>3))						:扩展的shell，用类似c语言的风格。
	
	
	 condition11 || condition12			:复合逻辑或，如果前面一个逻辑为真，则不执行后面一个逻辑判断，否则执行后面一个逻辑判断。举例：
	
		if [ $a -gt 1] || [ $b -gt 3 ];then
	
	condition1 && condition2			:复合逻辑与，只有前面一个操作成功，才会执行后面一个操作。该逻辑往往用来做连续两个动作。
	举例：
	
		[ $a > 1 ] && echo "a>1"
	
	expr中的逻辑：
	
		expr1 \| expr2	:逻辑或
		expr1 \& expr2	:逻辑与 
	
## 关于程序控制的总结

- awk的程序控制：

	awk与c语言很接近：在脚本中完全可以按照c语言的语法，下面是可以在命令行中输入：

	- 关键字：

			if,else if,else ,while,do,for,,break,continue,exit,{}switch,case
	- 语法：		

			if(condition)statement;else statement;
			for(expr1;expr2;expr3)statement;
			for(var in array) statement;
			do statement while(condition);
			while(condition) statement;
			switch(expr){case value:statement;...}
			break;
			continue;
			exit statement;
			delete array

- shell的程序控制：

	- 关键字：

			[],if,elif,else,fi,while,do,done,for,in,case,esac
	- 语法：	

			[ condition ] && statement;
			if [ condition ];then
				statement
			elif [ condition ];then
				statement
			else
				statement
			fi
			for var in seq ;do 
				statement
			done 
			while [ condition ];do 
				statement
			done
			case var in 
				var1)	statement;;
				var2)	statement;;
				*)		statement;;
			esac		

##sort:
- 用途：对文本中的内容进行排序。
	sort认为文本中的数据是结构化的，同awk类似，通过分隔符，将每行文本分成多个域，然后针对某个域进行排序。比较时如果两个记录的第一列的内容相同则根据第二列进行排序，以此类推。
- 调用格式：

		sort [options] [files]
- 选项：

	- -t 设置分隔符，默认分隔符是空格，通过分隔符将记录分成多列，可以设置多个分隔符。
	- -kn 设置比较的列，n是想要比较的列，从1开始。默认是第一列。
	- -n 指定按照数字比较，默认是按照字串比较，举举例果内容为100,默认是按照字串100进行比较。
	- -c 测试文件是否已经排序。
	- -m 合并两个已经排序的文件。
	- -r 逆序 
	- -o 输出文件 
	- -u 排除重复项

##uniq
- 用途	统计文件重复行
- 选项：
	- -c 显示重复行数次数及重复行内容
	- -u 显示非重复行
	- -d 显示重复行
	
uniq中的-u与sort中的-u不同，uniq中的重复行必须是连续的，而sort中的重复行可以不连续。

举例：

> 统计文本中单词的出现频率，显示出现次数和单词，次数多的在前面。
> 
>`cat record.txt|sed -e 's/\.//g' -e 's/://g' -e 's/ /\n'|sort|uniq -c|sort -nr;`
>
> 前面2个sed用于将不想统计的单词去掉，后面一个sed将用空格分开单词形成一个单列的文件，接着用sort将此文件排序，此文件中有重复行就是重复出现的单词，然后用uniq统计重复单词的数量，最后逆序输出该统计结果。

##join
- 用途：用于将两个类似数据库的文件连接起来
- 选项：	
	- -a1	除了共有部分记录，还列出文件1中不包括共有部分的记录
	- -a2 除了共有部分记录，还列出文件2中不包括共有部分的记录
	- -v1 仅列出文件1中不包括共有部分的记录
	- -v2 仅列出文件2中不包括共有部分的记录
	- -1  文件1中用于比较的关键字所在列，默认是第一列
	- -2  文件2中用于比较的关键字所在列，默认是第一列
	- -o  输出的列
	- -t  列分隔符
		如果两个文件有共有列，则列出包括共有列的记录的两个文件的所有列。
举例

	两个文件为：
	file1：
		1 a b c
		2 a1 b1 c1
		3 a2 b2 c2
	file2:
		1 a d e
		2 a2 d2 e2
	join file1 file2
	结果为：
		1 a b c d e
		2 a1 b1 c1 a2 d2 e2
	默认的是以第一列作为比较的关键字

##split
- 用途：分割文件
- 选项：
	- -n 分割成几个文件
	- -b size 按照字节数来分
	- -C size 按照字节数来分，尽可能保持行完整

##cut
- 用途：按列取出文件
- 选项 
	- -c n 从第几个字节取出  
	  -c 1,-c 1-2，-c1,3
	- -f 从第几域取出
	- -d 定义域分割字符

##paste 
- 用途：将两个文件按行合并
		paste [options] file1 file2
- 选项：	
	- -s 将连接的文件写在一行中
	- -d 定义连接符

举例 

	file1
		a b c
		a1 b1 c1
	file2：
		d e
		d1 e1
	paste -d@ file1 file2
	结果为：
		a b c @d e
		a1 b1 c1@d1 e1

##xxd
- 用途：显示二进制文件
- 选项：

	- -gn n为按照几个字节显示记录

##od
- 用途：显示二进制文件
- 选项
	- -t type
		type:
			c:character
			ox	o:octal x:1,2
			xx	x:hex	x:1,2,3..

##hexedit 
- 用途：显示二进制文件


##chkconfig 
- 用途：配置系统的服务程序

	维护位于/etc/init.d/目录下的服务配置脚本。添加，删除，修改。
- 说明：

	如果想配置一个服务。  
	1. 编辑一个服务脚本程序,文件名就是服务名,如server。

			case "$1" in
			    start)
			    cd /home/hanhj/tmp/language/py
			    /home/hanhj/tmp/language/py/server2.py &
			     ;;
			   stop)
			    killall server2.py
			       ;;
			   status)
			   status server2.py
			   ;;
			   restart)
			   $0 stop
			   $0 start
			   ;;
			 *)
			   echo "Usage:$0 {start|stop|status|restart}"
			   exit 1
			esac
			exit 0

	2. 将此文件加上可执行属性:sudo chmod +x server   
	3. chkconfig -a server;将此命令加入到服务中


查询服务

	chkconfig -l 
将服务打开

	chkconfig server on


如果想手动启停服务,可以 

	service server start|stop
	/etc/init.d/server start|stop


##uname
- 用途:显示系统版本
- 选项   
	- -r 显示核心版本,
	- -a 显示全部;

##history 
- 用途:　显示输入过的命令
- 配置  
	在~/.bashrc文件中可以有以下配置项  
	HISTCONTROL=ignoredups,忽略连续的重复输入  
	HISTCONTROL=erasedups,忽略所有命令中重复的输入  
	HISTTIMEFORMAT='%F %T|',配置命令前的时间

- 使用  
	history 数字,显示最近n条的输入命令  
	!n,执行数字指示的命令,注意是直接在控制台中输入  
	!char,执行最近的与char匹配的命令,举例最近执行了dir命令,则!dir就执行dir命令
	history -c,清除历史记录

##okular
- 用途：阅读和注释pdf
- 使用：  
	划线 f6

##evince
- 用途：pdf文档阅读器


## pencil2d
- 用途 ：作图

## pinta
- 用途： 作图

##crontab
- 用途：用来设置计划任务
- 选项：  
	- -e 编辑计划任务
	- -l 显示计划任务
	- -u 表示用户
- 说明：  
	编辑计划任务时，每条任务用：分 时 日 月 周几 用户 命令  表示  
	/n 表示每隔  
	n1-n2 表示从n1到n2   
	n1,n2 表示可选的数值  
	例如   
	
		#m h day_of_month month day_of_week user command  
		*/1 * * * *  hanhj echo "ddd"   
	表示每隔1分钟打印ddd  
- 配置    
	用户的crontab放置在/var/spool/cron/crontabs/user文件下  
	系统的cron放置在/etc/cron/crontab,/etc/cron.d/ 下



##开机服务程序 


- 系统的启动模式： 
	启动模式是指计算机启动的不同环境，在linux中有6种启动模式，分别为：

		 0-关机
		 1-单用户
		 2-不带网络的多用户
		 3-带网络的多用户
		 4-不可用
		 5-带图形界面的多用户
		 6-重启
		我们常用的是3,5
	 在etc目录下有rc.0，rc.1 ... 等目录，里面放的是不同启动模式下需要执行的活动。比如s01apache2，s表示启动如果是，k表示关闭，后面是一个数字, 最后是服务名。 该活动实际上是一个链接，链接到init.d中的脚本。 这样在不同模式下需要启动或关闭服务就可以通过修改链接（修改链接名的第一个字母）或添加删除链接来完成。

- 服务脚本  
	1. 编辑脚本  
		服务程序的脚本放在/etc/init.d/目录下。比如hello这个服务：

			文件名：/etc/init.d/hello
			文件内容：
			case "$1" in
				start()
					echo "my fun start"
					a.sh
					;;
				stop()
					echo "my fun stop"
					;;
				*)
					echo "usage $0 start)stop)"
					exit 1;;
			esac
	2. 配置脚本  
		- 用chkconfig   
			参见chkconfig命令
		- 用sysv-rc-conf	
			相比chkconfig，前者提供图形化的界面，使用起来更加方便。
			如果服务做了改动，举例删除了/init.d/xxx服务，可以用sysv-rc-conf -P 来清除缓冲区，使其不在图形界面上显示。
	3. 启动停止服务
			
			执行/etc/init.d/xx start or stop 
			or service xx start/stop 

- rc.local文件  
	/etc/rc.local是开机时最后执行的命令。可以将需要执行的命令放在其中。注意需要将要执行的程序的属性改成可执行，并放在环境变量path中


- systemd
	systemd是另外一种启动服务配置方法。  
	linux启动的过程：post->boot sequence->boot loader->Kernel+initrams->rootfs->/sbin/init    
	不同版本linux的init不同，在centos5中是systemV，在centos6中是upstart，在centos7中是systemd（可以看到/sbin/init实际上是链接到/lib/systemd/systemd）.  
	- 配置文件  
		- /lib/systemd/system/  
			这里面有后缀名为service,target,path等文件。service就是服务名，相当于/etc/init.d/中的文件，target是运行等级文件。
		- /etc/systemd/system/ 
			这里面是管理员的配置文件，是指向/lib/systemd/system中的链接文件。  
	- 命令：systemctl 
		- 调用格式 systemctl command [options]
		- command
			- start/stop  启动/停止服务

					systemctl start/stop xx.service
			- disable/enable 禁止/恢复服务：

					systemctl disable/enable xx.service 
					or systemcrl mask/unmask xx.servie
				实际上是在/etc/systemd/system/目录下创建一个该服务名的链接，该链接指向/dev/null 

			- kill 杀死服务

					systemctl kill xx.service
			- status 查看状态
		
					systemctl status xx.service
						is-active:是否激活
						is-enabled：是否禁止
					list-dependencies ：列出依赖关系
			- systemctl -t help 列出服务类别：  
				可以是service，socket，busname，target，snapshot，mount，device，automount，swap，timer，path，slice，scope。
			- list-units 列出指明类型的服务，列出其状态。

					systemctl list-units -t x or systemctl -t x
					x可以是service，或其他上面的类型。
		- 说明：  
			如果该服务不是属于systemd，则可能转交给systemd-sysv-install。例如apache2服务。所以有可能出现明明在/etc/init.d/中禁止的服务，但是依然不能禁止。  
			who -r ，runlevel，systemctl get-default,显示当前运行等级

##apt-key 
- 用途:获取公鈅
- 调用格式：

		apt-key [--keyring filename] command parameter
- command  
	- add filename :add a new key to the list of trusted keys.  
				the key is read from filename. - is stdin.
	- del keyid :keyid 就是list出来的/后面的字串
	- export keyid	:export key keyid to stdou 
	- exportall
	- -list	:list trusted keys 
	- --keyring filename :special keyring file the command should operate.default is trusted.gpg.files:  
		/etc/apt/trusted.gpg 

## gpg 
- 用途：获取公钥工具（pgp->pretty good privacy）
- 调用格式：

		gpg --keyserver URL --recv keyid
	URL是公钥服务器地址，比如：	keyserver.ubuntu.com，subkeys.pgp.net，pgpkeys.mit.edu 
			keyid是需要获得的公钥id
- 例如：获得一个公钥，并添加到本地

		gpg --keyserver keyserver.ubuntu.com --recv keyid 
		apt-key export keyid|sudo apt-key all -

##apt 
- 用途：软件包管理。在老的Ubuntu中为apt-get，新的Ubuntu中用apt代替。
- 调用格式：

		apt [opions] <action> [pkg]
- action:  
	- install pkg		:安装软件
	- remove pkg		:移除软件，但不包括配置文件
	- update			:根据/etc/source.list,更新软件信息
	- upgrade			:升级软件
	- dist-upgrade	:更新操作系统
	- search regex	:用regex来查找软件
	- show pkg		:显示软件包信息
	- edit-sources	:编辑软件源文件source.list 
	- list pkg		:显示软件包的安装状态。类似dpkg-query --list 
	- source pkg		:安装软件源程序包
	- build-dep pkg 	:为编译软件安装依赖包
	- autoclean		:清除下载的软件包
	- autoremove		:删除下载的一些不需要的依赖包。
	- download		:下载软件安装包deb文件到本目录。

pkg可以带版本号  
apt可以认为等同与apt-get  
安装软件时，如果不太记得名字，可以先用search 来找一下是否有类似名字的软件，找到后再用install来安装。  
如果需要软件包，可以用download来下载。  
如果下载源程序包，可以用build-dep解决依赖性问题。
	
- 使用中的几个问题：  
	1. 源的问题
		apt使用的源位于 /etc/apt/sources.list 中，可以手工修改。  

			deb http://packages.linuxdeepin.com/ubuntu precise main restricted universe multiverse
			deb-src http://packages.linuxdeepin.com/ubuntu precise main restricted universe multiverse
		第一列：deb是包，deb-src是包的源程序。  
		第二列：是源地址    
		第三列：precise表示版本，不同版本名称不同。 如果仅仅是更换源地址，版本不要变。网上的各种源后面所跟的版本号不要照抄。  
		后面列表示内容。
	2. 源认证  
		有些源需要公钥认证，此时需要将该源的公钥导入到本地。  
		需要用上面gpg命令中的方法导入公钥。
		
##apt-cache  
- 用途：用来查询apt包的程序。在ubuntu新版本中已经合并到apt中。
- 调用格式：

		apt-cache command 
- command:  
	- pkgnames	:print all installed package
	- dumpavail	:print all available package
	- showpkg pkgs	:print infomation of pkgs
	- search regex:查找软件包.apt search 可能找到一些不是精确匹配的软件。
		
##aptitude
- 用途：一种图形化的apt工具

##界面软件管理程序
- 用途：包括以下程序    
	software-properties-gtk 更新设置程序  
	gnome-software 程序管理程序  
	update-manager 检查更新软件程序  

##dpkg
- 用途：软件包安装工具	
- 调用格式：

		dpkg <action> [pkg]	:pkg 要求精确匹配
- action:
	- -i :安装软件
	- -r :卸载软件
	- -s :state显示软件安装包信息
	- -l :显示软件安装状态
	- -L --listfiles：显示软件包内文件
	
## dpkg-deb  
- 用途：软件包生成工具
- 调用格式：

		dpkg-deb <action> deb 
- action 
	- -b :产生一个deb文件
	- -x :解压一个deb文件 
	- -I :显示一个deb文件信息

制作一个my-app软件安装包；

> 首先创建以这个软件为名的目录  
> 然后将所需要安装的软件相关文件拷贝到这个目录中，这个目录是所安装系统的根目录。  
> 在这个目录下创建DEBIAN目录，在这个目录中创建control文件，作为dpkg创建deb文件的信息，内容如下： 
>
> 		Package:my-app  
> 		version: 1.4.0  
> 		architecture:i386  
> 		installed-size:4096  
> 		maintainer:gatieme  
> 		provides:bioinfoserv-arb  
> 		description: this is my-app   
> 		section:bioinfoserv-arbserv  
> 		depends:  
> 		suggests:  
> 然后执行：dpkg -b my-app 

## dpkg-query  
- 用途：软件包查询工具
- 调用格式
	
		dpkg-query <action> [software]
- action  
	- -l :显示软件安装状态
	- -s :state显示软件安装包信息 
	- -S filename search pattern  
	 	:serarch filename from install package 
	- -p package-name  
	 	:display details of package 
	- -L package name  
		:list files installed on your system of package


## snap  
- 用途：另外一个软件包命令行

##wget 
- 用途：从远程网站下载文件
- 调用格式：

		wget [options] url 
- 选项  
	- -r 递归 
	- -c 断点续传
	- -p 下载图片
	- -e 执行命令，如果远方网站有robots.txt里面有disallow的字眼，表示不能自动下载，这时可以用-e robots=off 来关掉此限制。

##nc 
- 用途：网络调试工具
- 调用格式

		nc [options] 
		server:服务端
			nc -l [ip] port ;ip不写默认是本地任选ip地址
		client:客户端
			nc ip port 
- 选项：			
	- -s ：设定socket中发送地址source ip，不能与-l同时使用
	- -S ：enable rfc 2385 tcp md5 signature option
	- -z ：scan listening daemons
	- -u ：udp
	- -p ：source port 
	- -l ：listening
	- -O ：specifies output size
	- -I ：specifiles input size
	- -4 ：use ipv4
	- -6 ：use ipv6

下面的命令可以将命令到服务端，并将执行结果返回到客户端

- 服务端：

		 rm -f /tmp/f   
		 mkfifo /tmp/f  
		 cat f|sh -i 2>&1|nc -l port >f  
- 客户端:  

		 nc ip port   
这时，客户端提示符为$，可以输入举例ls，cd等命令。ctrl-d退出。  

##tcpdump 
- 用途：网络抓包工具
- 调用格式：

		tcpdump [-i interface] [protocol] [port] 
		tcpdump tcp port 7998 ;抓取本机默认网卡的上tcp协议中所有端口号为7998的数据包。
- 选项 
	- -i 网卡
	- protocol 协议：ip,tcp,udp,icmp,arp,rarp，eth等
	- net 网络名，举例 tcpdump net xxx
	- port 与协议有关，
	- src 源
	- dst 目的地，举例tcp src port 7998，ip src 192.168.1.2
	- host 主机名，举例tcpdump host 192.168.1.2
	- 逻辑 and，or,!,>,<,==,!   
		例如不想抓某个ip的包：tcpdump tcp port 7998 and host ! 218.106.89.76。  
		可以用协议[字节]来获取相应协议的字节，从而达到对内容进行过滤的目的。举例：tcpdump ip[2:2]获取ip包的长度
	- -w 将原始包写入一个文件以供分析
	- -W 写入的文件c格式输出
	- -r 读入一个文件进行分析
	- -l 一边抓包，一边显示 tcpdump -l |tee dat; tcpdump -l >dat & tail -f dat 
	- -# 显示包号
	- -p 取消杂散模式
	- -t tt ttt tttt ttttt 显示时间格式
	- -v vv vvv 分析包
	- -U 一旦有包来了，立即更新写入的文件
	- -x，-xx，-X，-XX 分析文件
	- -Z 以某个用户身份使用。

举例：  
在本机抓取tcp协议的端口号为7998（src and dst），排除218.106.89.76地址，实时写入文件dat。

	tcpdump tcp port 7998 and host not 218.106.89.76 -w dat -U 
分析文件：

	tcpdump -r dat -X 

tcp格式	
	
        0                            15                              31
       -----------------------------------------------------------------
       |          source port          |       destination port        |
       -----------------------------------------------------------------
       |                        sequence number                        |
       -----------------------------------------------------------------
       |                     acknowledgment number                     |
       -----------------------------------------------------------------
       |  HL   | rsvd  |C|E|U|A|P|R|S|F|        window size            |
       -----------------------------------------------------------------
       |         TCP checksum          |       urgent pointer          |
       -----------------------------------------------------------------


##apache:
- 用途：web服务器  
- 安装

		sudo apt-get install apache2
- 配置  
	 配置文件位于/etc/apache2下  
	-  mods-available:  
	存放可以用于加载的模块，这里的模块不是真正的程序，而是配置文件  
	例如php模块,其相关文件内容如下

		php.conf

			<filesmatch ".php">
			sethandler application/x-httpd-php
			</filesmatch>
		php.load

			loadmodule php5_module /usr/lib/apache2/modules/libphp5.0.so

	-  mods-enable:存放来自mods-available的链接，这样就可以方便的选择是否装入这些模块了。
	-  sites-available:  
		存放可以访问的本机文件目录，包括根目录，虚拟目录。 
		在sites-available中的文件，其内容包括目录路径和目录描述。例如：


			 alias study /home/hanhj/study 这里描述一个虚拟目录和实际路径的对应关系
			 <directory /home/hanhj/study>
			 options indexes followsymlinks
			 allowoverride none
			 require all granted
			 </directory>
			 这里是对该目录属性的描述
	 - sites-enable：  
		存放sites-available的链接，通用用于方便的设置可供访问的目录
	 - ports.conf  
		 用于配置端口号
	 - apache2.conf   
		可以用来配置除了以上分开的配置文件未配置的内容；

##wiki  
- 用途：wiki is a php program with database,so it use apache,php and mysql(or other database)
- 安装  
	 1. install necessary program 

			sudo apt-get install apache2 mysql-server php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-xml 
		php is as a module of apache2. php version must suitible for apache,unless it will not work well,and up command is useful for install wiki envioument.
		
	2. download wiki program 
		download wiki programe from wiki web site,if you download diffrent version it will not work well possibly,in my envioument i use mediawiki-1.26.3(the new version 1.27.1 report error when run index.php);

	3. extract wiki source  
		
		tar zxvf mediawiki-1.26.3.tar.gz
		
	4. config apache sites-enable for wiki:

		vi /etc/apache2/sites-enable/httpd.conf
	5. config my sql  
		create a database for wiki

			mysql -u root -p
			mysql>create database my_wiki;
			mysql>grant all on my_wiki to wiki@localhost identified by '123456'
			mysql>exit
			Bye
		this is  not computer user account passwd ,but the database user passwd
	6.	add a computer user for wiki

			 sudo adduser wiki
			 passwd wiki (not necessary)
	7. config wiki in browse
		in browse :localhost/wiki  
		 config your wiki
		 and put LocalSettins.php in your wiki dictory

##mysql:
 		 
- 登录 

		login:mysql -u username -p
		mysql>show databases
- 创建数据库

		mysql> create database 数据库名称
- 查看所有数据库

		mysql> show databases ;
- 使用某个数据库

		mysql> use 数据库名称；
- 查看所使用数据库下所有的表
	
		mysql> show tables;
- 显示表的属性结构

		mysql> desc 表名；
- 创建数据库

		mysql> create database 数据库名称
- 删除数据库

		mysql> drop database databasename;
- 创建表

		mysql> create table 表名 (列的名字(id)类型(int(4))primary key(定义主键) auto_increment(描述 自增))
		create table newtable like oldtable;根据oldtable复制newtable的表结构;
- 删除表

		mysql> drop table tablename;
- 更改表

		mysql> alter table 表名 add/drop field [type]
		mysql> alter table 表名 modify field type
		通用的sql语句是alter table 表名 alter column field Type
- 插入数据

		mysql> insert into 表名(field1,field2...) values(value1,value2...);
	   insert into table1 select * from table2,从table2中复制所有数据到table1中;
- 删除表中的数据
		
		mysql> delete from table where id=？[or name=? (and name=?)];
		delete from table ;删除所有数据
- 更新数据

		mysql> update 表名 set field1 = value,field2=value where...\ 
- 选择表中数据的显示   
	- \* 代表选择所有列 ，
		
			mysql> select * from 表名 where id=?[and name=？] [or name=?];
			mysql> select id,name from 表名 order by 某一列的名称 desc(表示降序)
	- 联合 

			mysql> select table1.field1 table2.field2 from table1,table2 where table1.field = table2.field
			select table1.field1 table2.field2 from table1 inner join table2 on table1.field=table2.field
			select a.name ,b.name, b.age from student a inner join person b on a.name=b.name;
- sql中的数据类型：  
	integer(size)  
	int(size)  
	smallint(size)  
	tinyint(size)  
	decimal(size,d)  
	numeeric(size,d)  
	char(size)  
	varchar(size)  
	date(yyyymmdd);

##设置动态库搜寻路径： 
1. 方法1  
	修改/etc/ld.so.conf.d/在此路径下添加一个文件指明路径

2. 方法2  
	修改~/.bashrc文件，添加一行：export LD_LIBRARY_PATH=想要的路径;$LD_LIBRARY_PATH
- 静态和动态连接：  
	如果是静态连接需要加上　--static选项，
		
		g++ -I /usr/local/include/　a.cpp -L /usr/local/lib/ -lboost-serialization --static -o a
如果是动态连接,可以不加上static ,但是需要用上面的方法指明库搜寻路径。  
一般第三方的库，会在配置文件时指出--prefix=xxx的选项，用于指明安装目录，我们一般放在/usr 或者/usr/local目录下，这样一般是在linux默认的搜寻路径中a

##gdb:
- 用途:调试程序，
	需要在编译和连接时加上-g选项。
- 调用格式:  

		gdb [options] file
	　　gdb PID exe_id  运行时调试
- 选项： 
	- --symbols=SYMFILE
		从指定文件中读取符号表。
	- --se=FILE 
		从指定文件中读取符号表信息，并把他用在可执行文件中。 
	- --core=COREFILE 
		调试时core dump的core文件。 
	- --directory=DIR
		加入一个源文件的搜索路径。默认搜索路径是环境变量中PATH所定义的路径

- 调试时命令：  
	- 在gdb中输入命令，支持tab补齐。
	- 设置输入参数：set args

			set	args 1 2 3 ：设置输入参数1 2 3
	- 显示输入参数： show args  
	- 装入调试程序：file xx  
	- 显示源程序：list 简写l  

			list		显示当前行范围前后的源程序  
			list line	显示当前文件的line范围前后的源程序  
			list -line	向前显示  
			list +line	向后显示  
			list first，last  
			ist file:line	显示文件file的line行  
			set listsize count设置一次显示的行
	- 编辑代码	edit 简写ed   
		需要设置EDITOR环境变量，如果没有设置默认是/usr/bin/ed\		
	- 其他一些相关命令：  

			make,编译代码  
			cd 改变路径  
			pwd 显示路径  
			shell 执行shell，需要设置SHELL环境变量，如果没有设置默认是/usr/bin/sh
	- 显示信息：
			
			info ，简写i。 
			info xx	;xx是定义的一些信息体。
				xx包括：
				break	断点信息  
				locals	局部变量  
				args	输入参数  
				frame	调用栈  
				...  
	- 显示调试程序（debuger）的信息: 
		
			show xx ；xx是定义的一些调试程序信息。  
				xx包括：
				ada -- Generic command for showing Ada-specific settings  
				annotate	注释的级别。  
				args		显示参数  
				...  
	- 显示数据：  
		- 显示变量：print，	简写p

				print/format  var
				format表示显示格式。包括：
				x 按十六进制格式显示变量。 
				d 按十进制格式显示变量。 
				u 按十六进制格式显示无符号整型。 
				o 按八进制格式显示变量。 
				t 按二进制格式显示变量。 
				a 按十六进制格式显示变量。
				c 按字符格式显示变量。 
				f 按浮点数格式显示变量。 
		- 特殊变量：  

				`$pc`：程序计数器，
				`$fp`当前堆栈指针,
				`$sp`栈指针,
				`$ps`当前处理器状态
		- 显示数组：

				print base@length
				base是数组的起始地址名称，length是显示的长度
		- 内存：x 
		
				x/nfh addr 
				n 	is numbers will show
				f 	数据显示形式，
					x表示16进制，
					o表示8进制，
					d表示十进制，
					c表示字符，
					f表示浮点，
					s表示字符串
				h	表示每个数字的宽度，默认是word
					b表示1个byte，		(byte)
					h表示半个字2个byte，(short)
					w表示一个字4个byte，(word)
					g表示8个byte		(longlong)
		- 自动显示变量：display expr  
			每当到达断点时自动显示变量  
			`display /i $pc` 会在断点时显示机器代码和源代码。  
			`undisplay dnums`  
			`delete display dnums`  
		- 显示数组或变量类型：

				 whatis 变量， 
				 ptype 变量,
			 ptype比whatis显示更多信息。

	- 设置变量：set

			set 变量=value
			set args 1 2 3
	- 执行：run,next,continue  

			run 全速运行，			简写r
			next[count] 不进入的单步执行，	简写n
			step[count] 进入的单步执行，	简写s
			continue[count] 继续执行，		简写c
			count是执行的步数，如果不带count默认是执行1步。

	- 函数调用：call 

			call function-name
			call fun（1,3）
	- 程序暂停：break,watch,handle  
		- 断点：break 简写b  
			- 设置断点   
				设置行断点:		b line  
		 		设置文件的断点	b file:line   
		 		设置函数断点	b function  
				设置条件断点	b line  if contion  

					b 20 if count==100
					对于条件的维护：condition 简写cond
					对于已经设置的断点，可以添加删除，忽略条件。
					添加条件：	condition bnum expr
					消除条件： 	condition bnum 
					忽略条件：	ignore bnum count，表示忽略断点count次
					bnum是已经存在的断点号。
			- 查看断点 info break
			-  删除断点：delete bnum，简写d，
				
					d 2
					如果不带bnum则删除所有断点。
			- 禁止断点：disable bnum
			- 允许断点：enable bnum	
			- 设置断点暂停后的动作：commands bnum  
				由commands 。。。 end组成  
				如果不带bnum，则以最近的一个断点为断点。
					b foo if count==100	设置一个条件断点  
				 	commands 设置断点后的命令。在gdb中敲commands后回车，gdb会出现>的提示符，此时可以输入命令。以end为结束。  
			 		printf “count==100”  
	 				continue  
	 			end  
		 		使用commands可以方便自动化测试。
					
		- 观察点：watch  
			设置观察点后，当观察点数据发生变化，可以自动停下来。

				设置watch：watch var
				查看watch ：info watch
				删除watch ：delete watch watch_number

		- 捕捉信号：handle 

				handle handle-name control
			handle-name：
					
				SIGPIPE，SIGINT。。。
			control:

				 nostop：不停止程序，也不发送给程序
				 stop:停止程序
				 print：显示一条信息
				 noprint：
				 pass：将信号发送给程序
				 nopass：停止程序，但不发送信号给程序
		 
		 - catch event，
			event可以是：

		 		throw
				 	catch
				exec
				fork
			 	vfork
			 	load/unload
		 	
	- 栈：frame 简写f  
		 bt	显示当前调用栈  
		 f	显示当前代码  
		 info f 显示栈信息,寄存器信息		
	
	 [gdb help](gdb_help.html)

- gdb的移植：

	为了在目标板上运行gdb，可以做以下移植工作：  

	1. 下载代码，从gnu网站上下载gdb，和ncurses代码  

			www.gnu.org/software/software.html
	2. 编译ncurses  
		ncurses是一个文本的gui界面库

			./configure --host=your cross compile --prefix=where you want install --without-ada --enable-termcap --with-shared
			./configure --host=arm-none-linux --prefix=/home/bin --without-ada --enable-termcap --with-shared
		需要注意的是：cross compile 就是你的交叉编译器的前缀，在编译之间要设置环境变量path路径，使得能够找到该交叉编译器。

			make 
			make install
	3. 编译gdb

			./configure --host=your cross compile --prefix=where you want to install --without-x --disable-gdbtk --disable-tui --without-included-regex --without-included-gettext CPPFLAGS=your ncurese include  LDFLAGS=your ncurese lib dir
			./configure --host=arm-none-linux --prefix=/home/bin --without-x --disable-gdbtk --disable-tui --without-included-regex --without-included-gettext CPPFLAGS=-I/home/bin/include  LDFLAGS=/home/bin/lib
	编译好后，gdb就在gdb目录下，可以拷贝到目标板运行，同时也要拷贝ncurses的库。gdb调试的时候，需要源文件，如果是简单的程序，可以直接拷贝到目标板，如果程序较大，可以将计算机挂载到目标板上进行调试。

			mount -t smbfs your ip/dir mount dir -o dir_mod=xxx,file_mode=xxx,noserverino,uid=xxx,gid=xxx
			mount -t smbfs //192.168.15.23/share_doc /mnt/tmp/ -o dir_mod=0777,file_mode=0777 ,noserverino,uid=1001,gid=1001
	这样就可以直接在目标板上调试保存在计算机上的程序了，而不用拷贝。

ddd是一个基于gdb的图形界面环境，  
gdbtui是一个基于gdb的文本界面环境。

##valgrind
- 用途：内存检查工具  
	Valgrind的最新版是3.2.0，它一般包含下列工具： 
	1. Memcheck   
	最常用的工具，用来检测程序中出现的内存问题，所有对内存的读写都会被检测到，一切对malloc()/free()/new/delete的调用都会被捕获。所以，它能检测以下问题。  
		- 对未初始化内存的使用； 
		- 读/写释放后的内存块； 
		- 读/写超出malloc分配的内存块； 
		- 读/写不适当的栈中内存块； 
		- 内存泄漏，指向一块内存的指针永远丢失； 
		- 不正确的malloc/free或new/delete匹配； 
		-  memcpy()相关函数中的dst和src指针重叠。

		这些问题往往是C/C++程序员最头疼的问题，Memcheck在这里帮上了大忙。 
		- 用法：
		
				valgrind --leak-check=full --show-reacheable=yes --trace-children=yes --log-file=logfile  your program
			然后会在当前目录看到一个logfile文件，然后就可以查看这个文件检查问题了。
	2. Callgrind   
	和gprof类似的分析工具，但它对程序的运行观察更是入微，能给我们提供更多的信息。和gprof不同，它不需要在编译源代码时附加特殊选项，但加上调试选项是推荐的。Callgrind收集程序运行时的一些数据，建立函数调用关系图，还可以有选择地进行cache模拟。在运行结束时，它会把分析数据写入一个文件。callgrind_annotate可以把这个文件的内容转化成可读的形式。 
		- 用法：
		
				valgrind --tool=callgrind  your program
			然后可以发现在当前目录中有一个callgrind.out.xxxx的文件，可以直接查看这个文件看调用关系，但是很复杂。  
			可以用kcachegrind callgrind.out.xxxx来查看，这是个图形化程序。左边窗口是所有调用的函数及其调用次数，运行时间所占比例等，右边窗口上半部是左边窗口所选择函数的调用者信息，下半部是该函数调用的函数信息。
	3. Cachegrind   
	Cache分析器，它模拟CPU中的一级缓存I1，Dl和二级缓存，能够精确地指出程序中cache的丢失和命中。如果需要，它还能够为我们提供cache丢失次数，内存引用次数，以及每行代码，每个函数，每个模块，整个程序产生的指令数。这对优化程序有很大的帮助。 
		- 用法：
		
				valgrind --tool=cachegrind  your program,
		然后可以发现在当前目录中有一个cachegrind.out.xxxx的文件，可以直接查看这个文件.也可以用kcachegrind程序来查看。
	4. Helgrind   
	它主要用来检查多线程程序中出现的竞争问题。Helgrind寻找内存中被多个线程访问，而又没有一贯加锁的区域，这些区域往往是线程之间失去同步的地方，而且会导致难以发掘的错误。Helgrind实现了名为“Eraser”的竞争检测算法，并做了进一步改进，减少了报告错误的次数。不过，Helgrind仍然处于实验阶段。 
		- 用法：
		
				valgrind --tool=helgrind --log-file=log your program,
		然后查看log文件
	5.  Massif  
	堆栈分析器，它能测量程序在堆栈中使用了多少内存，告诉我们堆块，堆管理块和栈的大小。Massif能帮助我们减少内存的使用，在带有虚拟内存的现代系统中，它还能够加速我们程序的运行，减少程序停留在交换区中的几率。 
		- 用法：

				valgrind --tool=massif your program,
		然后可以在当前目录中看到有一个massif.out.xxxx文件，可以查看该文件检查堆的使用情况。

	此外，lackey和nulgrind也会提供。Lackey是小型工具，很少用到；Nulgrind只是为开发者展示如何创建一个工具。我们就不做介绍了。  
- 调用方法：

		valgrind --leak-check=full --show-reacheable=yes --trace-children=yes --log-file=logfile  ./a.out
	valgrind使用memcheck工具来检查，如果是守护进程，可以用killall memcheck来退出进程。实际上有一个默认选项--tool=memcheck
- 检查代码覆盖：
	
		valgrind --tool=callgrind ./a.out
		killall callgrind
	检查当前目录下有一个callgrind.out.xxx文件，xxxx表示当前程序的pid。

		callgrind_annotate --auto=yes callgrind.out.xxx>log
	然后可以用vi来查看这个文件。
- 安装  
	valgrind需要下载和安装。下载来自www.valgrind.org,程序为valgrind-x.x.x.tar.bz2.  
	下载后
	
		tar vxf valgrind-x.x.x.tar.bz2  
		./configure --prefix=/usr/local
		make install

另外一个检查内存泄露的工具是mtrace,不需要下载，在ubuntu中已经自动安装了，需要做的是在文件中加入下列语句:

		...
		#include <mcheck.h>
		...
		main(){
		...
		 set("MALLOC_TRACK","output",1);
		 mtrack();
		....
		}
运行后在当前目录下，会产生一个output 文件，可以用mtrace output来查看。
但是mtrace的记录都是机器级的，不如valgrind来的直接，是代码级的。


##单元测试中的代码覆盖率检查：
1. 在cppflags或cflags中加上 -fprofile-arcs -ftest-coverage
2. 在ldflags中加上 -fprofile-arcs -ftest-coverage
3. 编译文件，可以看到在当前目录中有后缀名为gcno文件
4. 运行程序，可以看到在当前目录中有后缀名为gcda文件，此时文件中已经包括了代码覆盖信息。但是还不能直观的显示出来。
5. 下载lcov工具，http://ltp.SourceInsight.net/coverage/lcov.php
	lcov-x.x.tar.gz,
	 tar -zxvf lcov-x.x.tar.gz,mak install
6. lcov -d .  -o coverage.info -b . -c -t your programe
7. genhtml  coverage.info-o 想要输出的目录
8. 可以看到在当前目录下有一个你刚才建立的输出目录，里面是html文件，用浏览器查看index.html文件。

##doxygen:用于生成项目帮助文档
1. 下载工具：

		sudo apt-get install doxygen
2. 在项目所在目录 doxygen -g 会生成一个Doxygenfile 配置文件。

		 这里面的大多数内容可以不修改，主要要修改的地方
		 PROJECT_NAME           = "项目名称"
		 OUTPUT_DIRECTORY       =doxygen_file//设置输出目录
		 OUTPUT_LANGUAGE        =Chinese //语言选择
		 EXTRACT_PRIVATE        = YES//是否要检查private中的变量或函数
		 GENERATE_RTF           = YES//是否产生rtf文件，默认是在rtf目录下的refman。rtf
		 EXTRACT_LOCAL_CLASSES YES 是否解析源文件（cpp文件）中定义的类
		 SOURCE_BROWSER NO 如果为YES，源代码文件会被包含在文档中
		 INLINE_SOURCES NO 如果为YES，函数和类的实现代码被包含在文档中
3. 注释代码

		 @exception {exception description} 对一个异常对象进行注释。
		 @warning {warning message } 一些需要注意的事情
		 @todo { things to be done } 对将要做的事情进行注释
		 @see {comment with reference to other items } 一段包含其他部分引用的注释，中间包含对其他代码项的名称，自动产生对其的引用链接。
		 @relates 通常用做把非成员函数的注释文档包含在类的说明文档中。
		 @since {text} 通常用来说明从什么版本、时间写此部分代码。
		 @deprecated
		 @pre { description of the precondition } 用来说明代码项的前提条件。
		 @post { description of the postcondition } 用来说明代码项之后的使用条件。
		 @code 在注释中开始说明一段代码，直到@endcode命令。
		 @endcode 注释中代码段的结束。
		 ///产生一条消息给control类，用于转发主站直接对电能表的批量抄读，1,2,3,4等级数据的返回
		 /**
		 ***********************************************************************
		 *  @brief  清除电表事件等级参数列表
		 *  @author  hhj
		 *  @param[in] AmmeterEventGrade &grade 电表事件分级表
		 *  @return  grade.data_id_set清除
		 *  @note 无。
		 *  @see  NULL
		 ***********************************************************************
		 */
	 以上都是有效的注释
4. 运行 doxygen，会自动在doxygen_file目录下产生html和latex目录

##网络配置：
### ifconfig
- 用途：启停网络设备，配置ip地址（临时的），子网掩码，
- 调用格式

		ifconfig [interface] [options] [address]
- 选项  
	- 没有任何参数，显示当前所有接口网络状态
	- interface 当前网络接口。  
		可以用ls /sys/class/net 来显示当前的网络接口，其实是一个链接。一般以太设备命名为enxxx,无线设备命名为wlxxx.  
		cat /sys/class/net/enxxx/address 来显示mac地址。
	- netmask 用来配置子网掩码
	- metric 用来配置数据包转发次数。
	- -arp 允许或禁止arp
	- -allmuti 允许或禁止无区别模式
	- -promisc 关闭或启动混杂模式
	-	media 网络媒介10base2,10baseT，100bseT
	- mem_start 驱动内存开始地址
	- mtu 每个包的最大长度
	- add <地址>配置ipv6地址
	- del <地址>删除ipv6地址 
	- -s 显示当前网络通讯发送接受字节信息
	- up 启动网络设备
	- down 关闭网络设备
	
			ifconfig eth0 192.1688.1.103 netmask 255.255.255.0 up/down 


###	改变接口名称
一般以前的网络接口名都是ethx，如果觉得现在的命名不爽，可以用下面的方法来改变：

		/etc/udev/rules.d/10-network.rules 
这个文件中是配置网络接口底层信息的地方，可以配置mac地址和名称：

	SUBSYSTEM=="net",ACTION=="add",ATTR{address}=="88:ae:1d:d2:d0:4d",NAME="net0"
	NAME最好不要配置成ethx，免得冲突。地址可以用上面的命令获得。
修改好后，如果想立即生效，可以先删除系统中该接口的驱动，然后重新插入。  
查找该接口的驱动可以用lspci -v来显示

	07:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8101/2/6E PCI Express Fast/Gigabit Ethernet controller (rev 02)
	Subsystem: Lenovo RTL8101/2/6E PCI Express Fast/Gigabit Ethernet controller
	Flags: bus master, fast devsel, latency 0, IRQ 26
	I/O ports at 2000 [size=256]
	Memory at 95110000 (64-bit, prefetchable) [size=4K]
	Memory at 95100000 (64-bit, prefetchable) [size=64K]
	Expansion ROM at 98100000 [disabled] [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: r8169
	Kernel modules: r8169
从上面的最后一句话可以看出该接口使用的模块是r8169，该模块位于/lib/modules/当前内核/kernel/drivers/net/ethernet/realtek/r8169.ko.如果不知道位于何处，可以用locate 模块名 来搜索。然后，rmmod r8169 ,insmod /lib/modules/.../r8169.ko来重新加载模块，这时用ifconfig来查看，可以看到接口名已经改变了。

	cat proc/net/dev:显示当前网络通讯发送接受字节信息，同ifoconfig -s ,netstat -i 
		
###为一个网卡配置多个ip地址：

	ifconfig eth0:1 xxx 为eth0添加一个配置（第一个是eth0:0）,ifconfig eth0:2 xxx为eth0添加第二个网卡配置 
以上配置都是一次性的，如果关机了，配置就掉了，你可以在/etc/rc.local添加以上配置。对于ubuntu你也可以在/etc/network/interfaces中配置，下面再描述。

### route
- 用途:配置路由：  
	路由就是与远方建立连接的通道表，通过目标地址和子网掩码来确定。
- 调用格式

		route [add] target [gw] [netmask] [interface]
		route [del] target [netmask] [interface]
		route add default gw 192.168.1.1

### 配置dns
本地dns文件位于/etc/resolv,内容如下：

	nameserver 8.8.8.8 --google dns

### 自动配置网络：
刚才讲了通过ifconfig方式来配置网络，但是此方法是一次性的，为了能够开机就能自动配置，可以使用下面的方法：
	linux下配置网络有两种方法，无界面方式和有界面方式。前者在通过/etc/network/interface,后者通过界面方式配置。

- 无界面方式：  
	配置文件为/etc/network/interfaces文件，该文件用于配置网络接口，并被ifup，ifdown来使用。文件内容如下：

		auto eth0
    	iface eth0 inet manual|static|dhcp 
	如果是static，可以配置ip地址，netmask，gateway。例如 

    	address 192.168.0.10
    	netmask 255.255.255.0
    	gateway 192.168.0.1
    	dns-nameserver 192.168.0.1
    	dns-nameserver 8.8.8.8
   	然后调用ifup|ifdown interface 来启动和停止网络，或者/etc/init.d/network restart。  
   	如果配置成manual，可能需要等一会才能ping通外面的网络，
   	如果配置成dhcp，会调用dhcpcd守护进程配置网络，可能需要等一会才能ping通外部的网络。  
	dhcpcd守护进程通过/etc/dhcpcd.conf文件来配置，文件内容如下：

    	# A sample configuration for dhcpcd.
    	# See dhcpcd.conf(5) for details.
    	# Allow users of this group to interact with dhcpcd via the control socket.
    	#controlgroup wheel
    	# Inform the DHCP server of our hostname for DDNS.
    		hostname
    	# Use the hardware address of the interface for the Client ID.
    	#clientid
    	# or
    	# Use the same DUID + IAID as set in DHCPv6 for DHCPv4 ClientID as per RFC4361.
    	# Some non-RFC compliant DHCP servers do not reply with this set.
    	# In this case, comment out duid and enable clientid above.
    		duid
    	# Persist interface configuration when dhcpcd exits.
    		persistent
    	# Rapid commit support.
    	# Safe to enable by default because it requires the equivalent option set
    	# on the server to actually work.
    		option rapid_commit
    	# A list of options to request from the DHCP server.
    		option domain_name_servers, domain_name, domain_search, host_name
    		option classless_static_routes
    	# Most distributions have NTP support.
    		option ntp_servers
    	# Respect the network MTU. This is applied to DHCP routes.
    		option interface_mtu
    	# A ServerID is required by RFC2131.
    		require dhcp_server_identifier
    	# Generate Stable Private IPv6 Addresses instead of hardware based ones
    		slaac private
    		可能要改动的地方是clinetid
    	也可以直接运行dhcpcd net0 以获得dns，或者dhclient来获得dns。

- 有界面方式：  
使用界面方式的配置文件为/etc/NetworkManager/NetworkManager.conf  
需要将其中的managed属性改为true

		[ifupdown]
    	managed=true
然后通过桌面右上角的网络配置添加网络配置，然后执行

		etc/init.d/network-manager start。 
 如果上面managed配置成false，右上角的网络会显示未托管。
    
有界面和无界面方式二者只能选一，如果改动了interfaces文件，有界面方式会关闭自己，显示未托管，除非特地指定managed为true。如果managed设置为true，则interfaces文件无效。

### 自动插入模块：
/etc/moudles中写入想要插入的模块，该文件被指向为 /etc/modules-load.d/modules.conf 。

### adsl 拨号上网：
基本工具是pppoe
	在ubuntu中的配置工具是采用ponconf。
	ubuntu：
	sudo pppoeconf 用来配置pppoe ，会弹出文本界面自动扫描当前网卡，提示输入你的adsl用户名和密码，询问是否开机自动启动连接。设置最后提示是否现在使用，同意后就能使用网络了。
	手动建立adsl连接命令是sudo pon dsl-provider，断开连接命令是sudo poff dsl-provider。
	为了建立dns，可以下载dhcpcd:sudo apt install dhcpcd .
	redhat：
	配置命令是adsl-setup,启动命令是adsl -start，停止命令是adsl -stop，可以在启动命令中加入adsl用于自动建立连接。
修改主机名：
	hotnamectl set-hostname=xxx
	注意同时要修改/etc/hosts文件，将其中的主机名修改，否则配置网络时会报“无法解析主机”的错误。

## rinetd:
- 用途：一个端口映射工具
- 配置
	/etc/rinetd.conf
	文件内容为：  
	绑定地址 绑定端口 发送地址 发送端口  
	0.0.0.0 1234 192.168.1.23 1234 

## pdftk 
- 用途：将多个pdf文件连接成一个文件

		pdftk file1 file2 ... cat output all.pdf 

##sysctl:
- 用途：用来控制一些系统参数
- 选项   
	- -a 显示所有系统参数

##convert 
- 用途：将图像文件转换成pdf文件

##ros 机器人操作系统

	https://wenku.baidu.com/view/1d15d1fd284ac850ac02422a.html

##连接库
编译程序时，往往涉及到库的路径问题，可以采用：

1. 修改LD_LIBRARY_PATH变量方式，修改环境变量的方法参见export说明。
2. 修改  /etc/ld.so.conf.d/下面文件，将需要的路径添加进来。

##bash脚本执行
1. bash xx 启动一个bash执行脚本。执行xx不会影响当前环境
2. chmod u+x xx 给脚本加上执行属性，然后 ./xx 。此方法也是启动一个bash去执行。
3. source xx 。在当前bash中执行脚本。执行xx会影响当前环境。
4. .空格xx 。也是在当前bash中执行脚本。

## Makefile编写：
Makefile用来管理包括多个文件的项目的编译，因为一般来说用手工编写，因此适用于比较小规模的项目，如果项目文件较多建议使用自动化程度较高的cmake或automake等工具。  
	Makefile类似与bash脚本文件，最基本的包括定义，依赖关系两个部分，此外makefile中也有控制语句，函数等，我们只要使用常用的部分基本就可以了，没有必要弄得太复杂。  
	定义就是定义一些需要用到的变量，常用的变量包括编译器，工程路径，源代码，目标文件，以及一些预定义的变量。变量的定义与bash中的定义方法是一致的，举例：CC=gcc，就是指定编译器为gcc，make工具有默认定义的规则和变量，可以用make -p 来查看。假设，目前的项目所有文件都在同一目录下，有两个文件main.cpp,lib.cpp  

	第一个Makefile
	proj=.
	target=test
	all:$(target)
	CC=gcc
	$(target):main.o lib.o
	以上用到的是make的默认规则，如果不用默认规则，可以这样写：
	proj=.
	target=test
	all:$(target)
	srcs=main.cpp lib.cpp  或者 srcs=$(wildcard %.cpp)
	objs=$(srcs:%cpp=%.o)	或则 objs=$(patsubst %.cpp,%.o,$(srcs))
	%.o:%.cpp
		$(CC) -c -g $< -o $@
	$(target):$(objs)
		$(CC) $(objs) -o $@
	.PHONY clean
	clean:
		@rm $(objs) $(target)
	
如果项目由多个目录组成，可以考虑在根目录建一个管理的Makefile，将通用的部分包括进来，在各个子目录中进行实际的编译，如下目录

	--root
		--app
		--lib
		--tools
		
app目录放置应用程序，lib放置一些库，tools放置一些工具程序  
在根目录下的makefile可以这样写：

	proj_root_dir=$(PWD)
	export proj_root_dir
	subdir=app lib tools 或者：subdir=$(shell ls -d */)
	for i in $(sbudir);do
		make -C $i||exit 1;
	done
	
	Makefile.rule:
	%.o:%.cpp
		$(CC) -c -g $< -o $@

	app/Makefile
	
	include $(proj_root_dir)/Makefile.rule
	target=test
	srcs=$(wildcard *.cpp)
	objs=$(srcs:%.cpp=%.o)
	objs+=$(proj_root_dir)/tools/*.o
	$(target):$(objs)
		$(CC) -L$(proj_root_dir)/lib -labc $(objs) -o $@	
	...
	
##编写so库：
	gcc -fPIC -c -g -Wall a.c
	gcc -shared -o a.so a.o
	使用的时候：
	修改LD_LIBRARY_PATH环境变量，指向so所在目录
	或者在 /etc/ld.so.conf.d/中添加你想要的路径
	静态库：ar rcs a.a a.o
		
##iconv:用于转换文字编码
	iconv -f infilecode -t tofilecode inputfile -o outputfile
	iconv -l :list all support code
	icov -f CN-GB -t utf-8 a.txt -o a.txt.utf8
	
##file 显示文件编码信息
	-i 按照mime形式显示

##pdftk：合并切割pdf

##pandoc:
	将markdown格式的文本转换成其他格式的文本.

##svn
	版本库
	svnserve 服务端
	调用格式：
		svnserve [options] reposdir
	选项：
		-d	daemon 
		-r	root dir 
	svn	客户端
	调用格式
		svn <command> [args]
	command:
		add			:add file into repos 
		commit(ci)	:提交
		checkout(co):检出。
		list(ls) 	:列出文件，只有一级目录,
		info		:显示版本库信息
		diff		：显示修改
	
		
	服务端：
		如果没有svn工具，首先要下载subversion
		创建一个新仓库：
			举例在/home/hanhj/下建一个仓库，根为/home/hanhj/svn ,在这个目录下有多个仓库，如test1,test2
			1.	建立仓库根目录：cd ~ && mkdir svn 
			2.	创建两个仓库：svnadmin create svn/test1 && svnadmin create  svn/test2。
			3.	启动svn服务器：svnserve -d -i /home/hanhj/svn 
			这时服务器如果一切正常就可以启动了，可以从客户端检出和上传。
		挂载原仓库：
			svnserve -d -r 原仓库的位置

	客户端：
		如果没有svn工具，首先要下载subversion
		检出：svn checkout svn://localhost/test1; ip和test1之间不要带svn，因为服务器是以svn为根目录，这里只要给出仓库名就可。
		修改后，可以用
			svn add:添加文件
			svn ci -m ""：提交修改
			svn diff :比较修改等操作

添加网络打印机：
	添加smb，windows共享打印机：
		sudo lpadmin -p name_of_printer -E -v url -m everywhere

	此时会在系统设置的打印机中出现一个myprinter，然后双击其属性，配置远程打印机及驱动。

计算器：
	gnome-calculater

libreoffice:
	办公软件
	localc	=excel
	lowriter=word
	lodraw
	loweb
	lomath
	loimpress	=powerpoint

grub
	根据需要编辑下列文件: 
	/etc/default/grub 
	/etc/grub.d/
	run update-grub

添加字体：
	一般linux的字体文件位于 /usr/share/fonts/目录下。
	将字体文件拷贝到该目录（或新建目录），然后执行
	mkfontscale,mkfontdir,lc-cache.
	fc-list :lang=zh可以查看安装的中文字体。


字号：
9小五
10.5五号
12小四
14四号
15小三
16三号
18小二
22二号
24小一
26一号
