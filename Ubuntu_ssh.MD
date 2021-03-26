Ubuntu开启ssh使用root用户登陆
默认不带ssh，所以需要安装一下ssh

sudo apt install openssh-server

====================================================/
设置ROOT密码方法如下：

开启终端，输入以下命令：

sudo passwd root

然后输入密码按"确认"键就OK了

====================================================/

切换root账号
使用nano,vi,vim等编辑

sudo nano /etc/ssh/sshd_config配置文件中如下配置:

# Authentication:
LoginGraceTime 120

PermitRootLogin without-password
StrictModes yes

RSAAuthentication yes

PubkeyAuthentication yes


很多时候需要允许root用户登陆

需要将PermitRootLogin without-password修改为PermitRootLogin yes.

然后重启ssh

sudo service ssh restart 这样就可以使用root用户登陆了

=====================================================/
赋予普通用户root权限

sudo nano /etc/sudoers

# User privilege specification

root	ALL=(ALL:ALL) ALL
poisonw    ALL=(ALL:ALL) ALL

