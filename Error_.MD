root用户被提示：Operation not permitted错误解决:

lsattr可用来查看文件的属性

chattr是用来更改文件属性

去除i属性：chattr -i 

添加i属性：chattr +i 
===============================/
Unable to locate package错误解决:

sudo apt-get update

sudo apt-get install XXX


update 是同步 /etc/apt/sources.list 和 /etc/apt/sources.list.d 中列出的源的索引，这样才能获取到最新的软件包，依旧报错查看并更换镜像源解决

cd /etc/apt
sudo cp sources.list sources.list.bak
sudo nano sources.list
===============================/



