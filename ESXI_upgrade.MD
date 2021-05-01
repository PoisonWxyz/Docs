ESXI 6.7  升级最新的安全补丁访问：https://my.vmware.com/group/vmware/patch 搜索最新patch
最新的是ESXi670-202102001.zip

存储-- datastore1 --数据浏览存储器

新建patch目录，将下载下来的文件上传 ESXi670-202102001.zip

主机--操作--进入维护模式

或者进入命令行：vim-cmd hostsvc/maintenance_mode_exit

输入命令指定patch文件地址

esxcli software profile update -d /vmfs/volumes/5e0c058a-95be1072-027d-c4834f10f528/patch/ESXi670-202102001.zip -p ESXi-6.7.0-20210204001-standard

"/vmfs/volumes/5e0c058a-95be1072-027d-c4834f10f528" #磁盘名称路径和升级包名称根据自己实际情况而定

选择启动安全shell 以便后面ssh登陆操作:

（主机->操作->服务->）

登陆ESXI的虚拟机


主机--操作--退出维护模式或者命令行

vim-cmd hostsvc/maintenance_mode_exit

查看升级包
esxcli software sources profile list --depot=/vmfs/volumes/5e0c058a-95be1072-027d-c4834f10f528/patch/ESXi670-202102001.zip

结果:

ESXi-6.7.0-20210204001-standard

升级:

esxcli software profile update -d /vmfs/volumes/5e0c058a-95be1072-027d-c4834f10f528/patch/ESXi670-202102001.zip -p ESXi-6.7.0-20210204001-standard

# 查看版本
vmware -vl
无误重启
reboot
