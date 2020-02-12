#git服务器的安装与设置

## 1安装 openssh服务器
    sudo apt-get install openssh-server openssh-client

## 2创建个人公钥和私钥
    ssh-keygen -t rsa
    ssh-keygen -t rsa -C “YourEmail”  这样产生的key包括email地址

 默认生成2048位，如果需要提高安全级别，也可以通过`ssh-keygen -t rsa -b 4096`创建公钥和私钥 
     
 默认情况下，公钥和私钥会保存在~/.ssh目录下，id_rsa  id_rsa.pub

## 3建立git远程服务，建立远程仓库 
### 3.1安装git软件
    sudo apt-get install git-core  
### 3.2创建git管理用户
    sudo useradd -m git 


useradd 仅仅是创建一个普通用户，不要求输入密码  
-m 表示创建home目录  
userdel 删除用户


创建git用户也可以用adduser命令  


	sudo adduser git 
adduser 可以同时创建用户和组，同时输入密码  
deluser 删除用户和组  
--remove-home 删除用户的同时，删除用户目录。  
--group groupname 删除组

	
说明：如果用adduser创建用户，则同时创建了目录和密码，会给用gitosis来管理git仓库带来不便，所以如果想用gitosis来管理仓库最好用useradd来创建用户。如果用adduser来创建git用户，则只能用手工方式来管理仓库。


 passwd 用来修改用户密码

### 3.3创建git仓库存储目录 
		 
如果用gitosis来管理仓库，这一步不需要。


下面是手动建立仓库：  
建立仓库目录


	sudo mkdir /home/git/repositories
设置git仓库用户 



	sudo chown git:git /home/git/repositories
修改git仓库属性	


	sudo chmod 755 /home/git/repositories
 
### 3.4 初始化全局设置 
	 git config --global user.name "myname"
	 git config --global user.email "myname@server"
 这个与设置gitosis无关，一般都要设置，其设置的内容在用户目录下的.gitconfig文件中，在这个文件中可以设置alias别名，用来方便使用git。


	 [alias]
	 co=checkout
	 ci=commit
	 br=branch
	 …
 
## 4 安装gitosis 
### 4.1 安装python工具
	sudo apt-get install python-setuptools
这个需要，否则在gitosis目录下执行python setup.py install 出错。

### 4.2 克隆gitosis软件
	 cd /tmp
	 git clone https://github.com/res0nat0r/gitosis.git

### 4.3安装gitosis 
	 cd gitosis
	 sudo python setup.py install   安装gitosis的相关命令
	 sudo -H -u git gitosis-init < ~/.ssh/id_rsa.pub 
 这个命令会建立/home/git/repositories/gitosis-admin.git仓库，并将id_rsa.pub放入到/home/git/.ssh/authorized_keys中。  
  -H 表示在用户的目录，-u 表示用户

	 sudo chmod 755 /home/git/repositories/gitosis-admin.git/hooks/post-update
	 chmod 755 不必要，除非umask不是022.

### 4.4 管理gitosis
#### 4.4.1 克隆gitosis-admin仓库
	 cd ~
	 git clone git@host:用户名/gitosis-admin.git
	 例如： git clone git@localhost:gitosis-admin.git
下载gitosis-admin仓库。这里不需要加入repositories目录，由gitosis自动来加。


如果报错，比如	：


	 Cloning into 'gitosis-admin'...
	 ERROR:gitosis.serve.main:Repository read access denied
	 fatal: The remote end hung up unexpectedly
可能原因：  
1.检查输入命令拼写是否有错。  
2.不要输入路径，由gitosis自动管理，比如


	git clone git@localhost:repositories/gitosis-admin.git 
	多了repositories
#### 4.4.2 配置gitosis
 gitosis-admin目录下有keydir目录和gitosis.conf文件。  
 keydir：用来存放各个用户的公钥。  
 将各个用户的id_rsa.pub公钥文件，拷贝到这个目录下。注意要改名为xxx.pub,xxx就是用户名。  
  
 
 gitosis.conf：用来分配仓库和用户权限。


	 [gitosis]
	 [group gitosis-admin]
	 writable = gitosis-admin
	 members = a
	 [group developers]
	 writable = helloworld
	 members = a b
	 [group test] 
	 readonly = helloworld
	 members = c
 这个配置文件表达了如下含义：  
  gitosis-admin组成员有a，该组对gitosis-admin仓库有读写权限；  
  developers组有a，b两个成员，该组对helloworld仓库有读写权限；  
  test组有c一个成员，对helloworld仓库有只读权限。 


 当然目前这些配置文件的修改只是在你的本地，你必须推送到gitserver上才能真正生效。 加入新文件、提交并push到git服务器： 


	 git commit -am "add helloworld project and users"
	 git push 
### 4.4.3使用gitosis添加新仓库：
	cd ~
	mkdir test
	git init test
	...make some chang in this directory.
	git ci "init"
	git remote add origin git@localhost:test.git 
	git push origin master 

## 5手动管理git 
由于种种原因，比如数据库迁移，需要手动来管理git仓库。


	sudo vi /home/git/.ssh/authorized_keys
	将其他用户的公钥放到这个文件中，保存。
	cd /home/git/repositories/ 
初始化仓库


	sudo git init test.git 
将目录改为git用户拥有

	sudo chown git:git test.git -R
客户端：

	git clone git@localhost:repositories/test.git 
注意：这里就要加上绝对路径了。此时，用户是以git用户身份运行的。

## 6 gitweb 
gitweb是一个展示git仓库的网页服务器。

### 6.1 安装gitweb 
	sudo apt-get install gitweb
 默认是安装到/usr/share/gitweb目录下

### 6.2 配置gitweb
 修改/etc/gitweb.conf 内容： 


	 # path to git projects (<project>.git)
	 #$projectroot = "/var/cache/git";
	 $projectroot = "/home/git/repositories";
 一般只需要改这个就可以了


### 7 apache2
gitweb需要通过apache服务器来提供服务，所以需要安装apache服务器。

#### 7.1 安装apache
	sudo apt-get install apache2
判断是否安装成功可以用浏览器访问`localhost`。

#### 7.2 配置apache 
 apache默认的web目录是/var/www/html，默认的cgi目录是 /usr/lib/cgi-bin/。  
 apache的配置文件位于/etc/apache2目录下：  

	 apache2.conf 总的配置文件，包括其他配置文件，设置访问目录权限。 
	 conf-available/ 放置各个应用的配置文件  
	 conf-enable/ 放置起作用的各个应用配置文件  
	 mods-available/放置各个模块的配置文件  
	 mods-enable/放置起作用的各个模块配置文件  
	 sites-available/放置虚拟主机，端口配置  
	 site-enable/放置起作用的虚拟主机，端口配置。  


 为了使gitweb起作用，需要启用cgi模块：


	sudo ln /etc/apache2/mods-available/cgi* /etc/apache2/mods-enable -s
重启apache2:


	sudo /etc/init.d/apachec2 restart 
然后，用浏览器访问localhost/gitweb。


 如果没有找到项目，可能是git仓库的权限不对，你需要将/home/git/repositories/*.git 的属性改为755，让apache用户有可读权限。
	
	
	sudo chmod 755 /home/git/repositories -R 


/etc/apache2/conf-available/gitweb.conf 


	<IfModule mod_alias.c>
	  <IfModule mod_mime.c>
	    <IfModule mod_cgi.c>
	      Define ENABLE_GITWEB
	    </IfModule>
	    <IfModule mod_cgid.c>
	      Define ENABLE_GITWEB
	    </IfModule>
	  </IfModule>
	</IfModule>
	
	<IfDefine ENABLE_GITWEB>
	  Alias /gitweb /usr/share/gitweb
	  <Directory /usr/share/gitweb>
	    Options +FollowSymLinks +ExecCGI
	    AddHandler cgi-script .cgi
	  </Directory>
	</IfDefine>

### 8 Cgit
 Cgit是另外一个类似gitweb的git仓库页面显示软件。

#### 8.1 安装cgit

	
	cd /tmp 
	git clone git://git.zx2c4.com/cgit
	make get-git
	make 
	make install
Makefile中默认的cgit安装目录是/var/www/htdocs/cgit  
这里可以修改CGIT_SCRIPT_PATH=你想要的路径，比如/usr/share/cgit  
make的时候可能会报找不到openssl头文件的错误，是因为没有安装openssl的开发包，可以执行：


	 sudo apt-get install libcurl4-openssl-dev
 如果这个命令也不行，就需要下载openssl的源代码，然后执行


	 sudo make install

make的时候有可能会找不到zlib头文件，可以执行：


	sudo apt install zlib1g-dev



 
####  8.2 配置cgit
 apache2的配置文件
 在/etc/apache2/conf-available/目录下添加一个cgit.conf文件,文件内容如下:


	<Directory /var/www/htdocs/cgit>
	    AllowOverride None
	    Options +ExecCGI
	    Order allow,deny
	    Allow from all
	</Directory>
	Alias /cgit.png /var/www/htdocs/cgit/cgit.png
	Alias /cgit.css /var/www/htdocs/cgit/cgit.css
	ScriptAlias /cgit "/var/www/htdocs/cgit/cgit.cgi/"
 cgit的配置文件
 在/etc目录下添加cgitrc文件。文件内容如下：


	#css logo.
	css=/cgit.css
	logo=/cgit.png
	#project
	scan-path=/home/git/repositories
	enable-index-links=1
	enable-index-owner=1
	enable-log-filecount=1
	enable-log-linecount=1
	#title
	root-title=hanhj.com git repositories
	#desc
	root-desc=Git repositories hosted at hanhj.com
	source-filter=/usr/local/lib/cgit/filters/syntax-highlighting.sh
 scan-path 表示自动搜索git仓库所在目录  
	
 原来可以起作用的配置  
 

	apache2的配置文件  
	Alias /cgit /usr/share/cgit   
	<Directory /usr/share/cgit>   
		AllowOverride None  
		Options +ExecCGI  
		Order allow,deny  
		DirectoryIndex /cgit/cgit.cgi  
		Allow from all  
		AddHandler cgi-script .cgi   
	 </Directory>  
	 cgit的配置文件  
	 在/etc目录下添加cgitrc文件。文件内容如下：  
	 css=/cgit/cgit.css   
	 logo=/cgit/cgit.png   
	 robots=noindex,nofollow   
	 scan-path=/home/git   
	 #repo.url=test.git   
	 #repo.path=/home/git/test.git   
	 #repo.desc=ggg   
	 #repo.owner=hanhj  
	如果要手工配置仓库则添加被注释掉的repo配置
   
 

 重新启动apache：


 	sudo etc/init.d/apache2 restart
 在浏览器中输入地址 http://localhost/cgit 就可以看到界面了



 可能要将www-data的用户加到git组中,否则www-data用户无法访问git仓库.

	sudo gpasswd -a www-data git 

 git仓库一般默认建在/home/git/repositories目录下.
