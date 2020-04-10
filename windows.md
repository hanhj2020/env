# windows使用技巧

1. xp中如何开启远程桌面

被访问机：  
	1）建立供外部访问的用户：  
	控制面板-》用户账户。。。或者直接用当前登录的用户名。  
	2）配置远程访问：  
	我的电脑-》右击鼠标-》属性=》远程-》远程桌面，允许用户远程连接次计算机  
	访问机：开始-》所有程序=》附件-》远程桌面连接，输入用户名，密码。  
2. xp中开启共享  
	1）修改本机名，所在工作组：  
	我的电脑-》右键=》属性-》更改-》修改计算机名，和隶属于域或工作组。  
	工作组一般名为workgroup。一般要求重启。重启后，查看：网上邻居=》（左侧）查看工作组，看本机是否在工作组中。  
	2）如果不在：  
		a。检查是否有防火墙，  
			关掉防火墙  
		b。是否安装了共享协议：  
			网上邻居-》右键-》属性-》在右侧当前连接上，点右键-》属性-》在常规中，看是否有Microsoft网络的文件和打印机共享。如果没有添加该协议。  
		c。是否开启了workstation，server，tcp/ip服务：  
			我的电脑-》右键-》管理-》选择服务和应用程序-》选择服务-》查看是否开启了以上服务
		下面是一个批处理文件，可以一次执行，开启以上服务。  
		服务关掉的原因可能是由于杀毒软件优化的结果。  
		　　@echo off  
			net start “Workstation” 》nulnet start “Server” 》nul  
		　　net start “TCP/IP NetBIOS Helper” 》nul  
		　　net start “DHCP Client” 》nul  
		　　net start “DNS Client” 》nul  
		　　net start “Windows Time” 》nul  
		　　net start “Windows Audio” 》nul  
		　　net start “Computer Browser” 》nul  
		　　exit  
	3）查看网上邻居：  
		1)网上邻居-》右键-》资源管理器-》网上邻居-》整个网络-》Microsoft Windows Network 可以看到工作组，以及工作组中的计算机。  
		2)可以在命令中输入计算机ip地址，或计算机名，直接查找。  
			开始-》运行-》输入\\ip  
3. excel中逆序  
	1。建立辅助列1,2,3，  
	2。选中表及辅助列  
	3。菜单中数据，排序，选择辅助列，逆序  
	4。删除辅助列  
4. excel中行列转置  
	选中表，复制，粘贴时选择选择性粘贴中的转置  
5. windows共享安全  
	目的在网络上只对特定用户共享文件  
	在资源管理器中工具-查看中勾去掉简单共享  
	然后再需要的共享文件夹上右击共享及安全，从安全选项中去掉everybody，添加需要共享的用户名  
  
5. 显示桌面  
	建立一个文件desktop.scf  
	[shell]  
	command=2  
	iconfile=explorer.exe,3  
	[taskbar]  
	command=toggledesktop  
	  
	win+d也是返回桌面的快捷键  
	  
6.	屏幕捕捉  
	微信alt+a  
	qq  
	ctrl+alt+a  
  
7. 在visual box中利用u盘来安装系统  
	在visual box中安装系统是，有时候，iso文件并不是启动光盘，只有启动U盘，此时需要用真实U盘启动。  
	为了使用真实U盘，要将U盘用一个文件来描述，然后加载这个文件，成为虚拟磁盘。  
	在visual box目录下运行  
	vboxmanage internalcommands createrawvmdk -filename xx.vmdk -rawdisk \\.\physicaldriveX  
	这里X是插入U盘后，所看到的磁盘号。0,1,2,3...  
	将此文件作为磁盘设备加载。然后按照磁盘，光驱顺序启动。  
  
8. 关掉一个程序  
	taskkill xx   
		/f force  
		/fi filter  
		/im	image name   
		/t tree all   
		  
		taskkill /F /im notepad.exe /im mspaint.exe   
	net stop service  
  
9. 网络应用  
清除连接的用户名密码 control keymgr.dll  
  
本地组策略编辑器	gpedit.msc  
  
计算机名描述：HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\ComputerDescriptions  
  
net use * /d 清除所有连接  
	  
10. excel 应用
lookup	lookup(待查数据,数据范围,返回范围)

	lookup(d4,a2:a5,b2:b5)
如果是引用外部数据
	lookup(待查数据,'文件路径\[文件名]表名'!范围,返回范围)


