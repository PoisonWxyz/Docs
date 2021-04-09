Debian普通用户获取root权限|sudo的安装与配置

Debian系统好像默认不安装sudo 首先登陆超级管理员账户，在 Terminal 命令行内输入 su ,“输入超级管理员密码，即进入root账户

apt-get install sudo


输入命令 adduser poisonw sudo

"poisonw"为将要赋予ROOT权限的用户名

配置sudoers文件，这里通过vi编辑器来写

vi /etc/sudoers

在vi命令模式中，输入 /%sudo 搜索定位到 %sudo ALL = (ALL:ALL) ALL，或者手动定位

在vi插入模式中（按一下 i 键），在  %sudo ALL = (ALL:ALL) ALL 下面键入 poisonw ALL = (ALL:ALL) ALL

在vi命令模式中，按ESC键 输入 :wq ,即可退出vi并保存文件

验证sudo是否安装成功

 sudo ls ，再输入用户密码

如果显示如下字样，则说明sudo安装与配置成功

Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
