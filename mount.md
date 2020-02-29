**名字：**

> mount命令用于挂载文件系统

**概要：**

>	mount -l|-h|-V  
	mount -a -[-fFnrsvw] [-t fstype] -[-O optlst]  
	mount [-fFnrsvw] [-o options] device dir  
	mount [-fFnrsvw] [-t fstype] [-o options] device dir

**描述：**

> Unix系统中所有文件被组织在一个从根目录/开始大的树型结构，文件分层结构中。这些文件被多个设备所散播。mount命令可以获得这些文件。通常，umount命令可以分离这些设备。文件系统用于控制数据如何被存放在设备中，或通过网络或其他服务虚拟的被提供。  
  
> 标准的mount命令形式:

>> mount -t type device dir  

> 这条命令告诉内核在发现的设备（ 类型是 type）上将目录dir与文件系统建立联系。配置项-t type 是可选的。mount命令通常用来检测文件系统。通常挂载一个文件系统时是需要root用户权限的。在下面的“非超级用户mount”章节将有详细描述。一旦挂载上，目录dir之前的所有者和类型都将不可见，dir将是所挂载设备文件系统的根。  

> 如果只是跟了一个目录或者一个设备，例如：  
	
>> mount /dir  

>  mount命令会在/etc/fstab文件中查找挂载点（如果没有找到将查找设备）。为了避免矛盾，可以加上--target 或--source选项。例如：  

>>  mount --target /mountpoint  
  
>   **列出所有加载**  
		列出功能仅仅是为了对后兼容。  
		如果想要更健全或者个性化的输出，请使用**findmnt**命令。注意在mountpoint中如果使用了控制字符将被用“?”来代替。  
		下面的命令用来列出所有加载的文件系统(类型已被用type标明)  
			mount [-l] [-t type]  
		-l用来在其输出字串中加上标签。（比如某个磁盘的标签）  
    
>   **指示设备和文件系统**	
大多数设备被一个文件名(块设备)来描述，例如 /dev/sda1 ,但是也有其他可能。比如对于一个NFS挂载，设备大概可以knuth.cwi.nl:/dir来描述。也有可能对于一个块设备用其文件系统标签或UUID（使用-L或-U选项在下面的描述中），或其分区的标签或UUID。分区标识被比如GUID分区表所支持（GPT）。  

> 对于一个磁盘分区的设备名不是固定的;硬件重新被配置，添加或移除设备都可能导致设备名变化，所以推荐使用文件系统或分区的标识来描述设备比如UUID或标签。

> 命令lsblk --fs可以提供可用的块设备的文件系统系统，标签，UUID等信息。命令blkid -p device可以提供给定的设备文件系统信息。

> 特别注意的是不能确保当设备移动，共享或者拷贝时UUID或标签仍然保持唯一。需要使用lsblk -o +UUID，PartUUID来确认在你的系统中UUID仍然保持唯一。

> 建议在系统设置时，在使用/etc/fstab文件时使用例如UUID等tags 而不是/dev/disk/等udev信号链接。使用这些tags更具有可靠性和可移植性。

> 注意mount命令使用字符串UUID 。无论是在fstab中或是命令行中UUID并不转换成内部的二进制形式。字符串形式的UUID必须使用小写形式。

> proc 文件系统并不链接到特定的设备上 ，当被挂载时，可被仲裁的关键字例如proc可以被用作特定设备。（用户可选的操作是使用none以减少当umount时出现打none busy信息的困惑）

> **/etc/fstab,/etc/mtab,/proc/mounts文件**  
文件/etc/fstab,被用来描述设备挂载到何处，如何使用选项。默认的fstab文件所在位置可以在命令行中使用--fstab path选项来改变。

> 命令 

>> mount -a [-t type] [-O optlist]

> （通常在启动脚本中） 此命令会挂载所有在fstab文件中涉及的文件系统，除非在脚本中所在行有**noauto**关键字。使用**-F**选项会使用fork方法来mount，这样使得挂载文件系统是立即的。

> 当挂载一个在fstab或mtab中维护的文件系统时，可以在命令行中使用设备名或挂载点。

> 命令mount和umount仍然维护一个传统的/etc/mtab文件。这个文件仍然被支持。但是在现代的Linux操作系统中该文件被一个指向/proc/self/mounts的链接所代替.因为一般的mtab文件存在于用户空间，并不能可靠的被使用在namespace。

> 如果没有参数使用mount，会列出当前所有挂载的文件系统。

> 如果想要修改当前在fstab文件中使用的选项，可以使用-o options：

>> mounts device|dir -o options

> 然后命令行中的选项会加到/etc/fstab中。有益的行为是如果有冲突会保证最后有效的配置。

> 如果同时给出设备名（或者label,uuid,partuuid,partlabel）和路径dir，mout将不会读fstab文件。比如：

>> mount /dev/foo /dir

> **非超级用户的mounts**  
通常，当mount一个文件系统时需要超级用户权限。但是，当在fstab中包括**user**选项时，任何人都可以挂载相关的文件系统。

> 假如，在fstab中有下面一行  

>> /dev/cdrom /cd iso9660 ro,user,noauto,unhide

> 任何用户可以用下面的命令在插入的光盘上加载iso9660文件系统  
	mount /cd 

> 注意mount命令对于非root用户是非常严格的，在命令行中的路径将被在fstab文件检查或帮助程序执行前校验。建议在使用mount时使用有效的挂载点，否则mount命令将失败。例如不建议使用mount命令来挂载NFS或CIFS文件系统。

> 更多的细节参见fstab(5)。只有挂载了文件系统的用户可以去卸载它。如果其他用户umount一个文件系统，在fstab文件中使用user选项。`owner`选项类似于`user`选项，限制用户必须拥有该设备文件。当通过一个脚本使得控制台拥有这个设备比如/def/fd
.`group`选项也是类似的，使得该设备被该组的成员所拥有。

> **Bind mounts**  
  将设备文件重新挂载到其他地方。例如：  
  `mount --bind olddir newdir `   
  或者使用fstab:  
  `/olddir /newdir none Bind `

> 当使用以上的方法后，同样的设备可以被两个地方所使用。它同样可能通过使用bindmount命令来从一个普通目录创建一个挂载点。
  `mount --bind foo foo`

> bind mount命令仅仅是链接单个文件系统，而不是子挂载。如果文件入口包括子挂载则使用下面形式：  
` mount --rbind olddir newdir `

> 注意被挂载的文件系统将于被挂载的原系统相同。

> 从V2.27版本开始mount命令如果加上--bind选项将被允许改变配置项。例如：  
`mount -o bind,ro foo foo `

> 这个特性并不是被linux kernel所支持，它将被在用户空间所支持。这个解决方案非原子的。

> 另外的（传统的）方法是创建一个只读的挂载当使用重挂载的时候，例如  
` mount --bind olddir newdir  `  
` mount -o remount ,bind,ro olddir newdir `

> 注意只读的挂载将创建一个只读的挂载点，但是原始的文件系统将是可写的，这意味着olddir将是可写的，而newdir将是可读的。

> 这当被使用`remount ,bind	`操作时，这将可能改变nosuid，nodev，noexec，noatime，nodiratime和实时的VFS入口标志。

> mount命令从V2.31版本开始当remount操作在命令行时，将被在fstab文件中所忽略。此意味着remount操作必须在mount命令行中完全控制。在早期版本中bind标志将被赋予并且重新定义mount操作将不被执行当有bind标志时。mount动作将没有效果，如果在fstab文件中有“remount，bind”命令时。

> **移动操作**  
移动一个被挂载的树到另外一个位置（原子的）。命令如下：  

> `mount --move olddir newdir `

> 这个操作将导致上下文从原来的olddir移动到新的可获得的新的newdir下。文件的物理位置没有改变。注意原来的olddir必须是一个挂载点。

> 注意如果移动一个存在与共享的挂载点中的挂载将不被支持。这个可以通过`findmnt -o target,propagation`命令来查看当前的共享标志。

> **共享的子树操作**  
自从V2.6.15版本开始可以将一个挂载点标志成共享的，私有的，从属的或非绑定的(shared,private,slave or unbindable) 。共享的挂载可创建一个镜像的挂载点，对该挂载点的挂载和卸载能够传播到其镜像点。从属的挂载可以接受从主到从的传播，但是反之不行。私有的挂载不具备传播能力。unbinable挂载是一个私有挂载，不能通过bind操作来克隆。语义在Documention/filesystems/shared-shutree.txt的内核源文件树中描述。

> 以上操作为：  

>	mount --make-shared mount_point  
	mount --make-slaved mount_point  
	mount --make-private mount_point  
	mount --make-unbindable mount_point


> 以下操作允许递归的改变在给定挂载点下的所有挂载的类型  
 
>	mount --make-rshared mount_point  
	mount --make-rslave mount_point  
	mount --make-rprivate mount_point  
	mount --make-runbindable mount_point  

> 当执行mount命令中的--make-*操作不读取fstab文件。所有必要的信息必须在命令行中指定。

> 在Linux内核中不允许在单个mount命令中改变多个传播特性，该特性也不能和其他配置项所混合。

> 从V2.23版本开始，mount命令允许在一个命令行中多个传播特性，并且将多个传播特性在多个命令中实现。这个特性是实验性的。传播特性被附加的mount系统调用所实现当执行mount命令成功时。注意该实例是非原子的。该特性可能在fstab文件中作为配置项所实现。（private,slave,shared,unbindable,rprivate,rslave,rsharce,runbindable）.

> 例如： 

> `mount --make-private --make-unbindable /dev/sda1 /foo`

> 此命令等同于： 

> mount /dev/sda1 /foo  
  mount --make-private /foo  
  mount --make-unbindable /foo 

**命令配置项** 

> 调用mount命令时所用到的配置项，首先来自于fstab文件，其次来自于命令中的-o配置项，最后加上-r或-w选项当存在时。

> mount命令并不是将所有在mount命令行中的配置选项都传递到/sbin/mount.suffix的mount帮助中。mount命令和mount帮助之间的接口在下面的扩展帮助章节中描述。

> mount命令行中配置项： 

> **-a,--all**  
挂载所有的在fstab文件中提及的文件系统（以给定的类型）。按照在fstab文件中给定顺序挂载文件系统。

> 注意用mount -a命令来检查fstab文件不是一个好主意。建议使用findmnt --verify命令。

> **-B,--bind**

> 重新挂载子树到其他地方。参照上面的**Bind mounts**章节。

