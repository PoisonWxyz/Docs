ubuntu安装和卸载软件命令

安装软件

命令： apt-get install softname1 softname2 softname3...

卸载软件

命令： apt-get remove softname1 softname2 softname3...

卸载并清除配置

命令： apt-get remove --purge softname1

更新软件信息数据库

命令： apt-get update

进行系统升级

命令： apt-get upgrade

 搜索软件包

命令： apt-cache search softname1 softname2 softname3

Deb软件包相关安装与卸载

安装deb软件包

命令： dpkg -i xxx.deb

删除软件包

命令： dpkg -r xxx.deb

连同配置文件一起删除

命令： dpkg -r --purge xxx.deb

查看软件包信息

命令： dpkg -info xxx.deb

查看文件拷贝详情

命令： dpkg -L xxx.deb

查看系统中已安装软件包信息

命令： dpkg -l

重新配置软件包

命令： dpkg-reconfigure xxx

解决依赖关系

命令：
sudo apt-get update(更新源)

sudo apt-get -f install

