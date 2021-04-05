



安装依赖
在Termux中：

pkg install x11-repo unstable-repo

pkg install qemu-utils qemu-system-x86_64


创建虚拟镜像(硬盘)
在Termux中：

qemu-img create -f qcow2 virt-alpine.img 8g

(8g代表创建一个最大容量为8g的镜像，可调节，最少2g以保证docker能正常安装)


启动虚拟机

在Termux中：

qemu-system-x86_64 -hda virt-alpine.img -cdrom alpine-virt-3.10.1-x86_64.iso -boot d -m 512 -nographic


(在Termux中：wget http://dl-cdn.alpinelinux.org/alpine/v3.10/releases/x86_64/alpine-virt-3.10.1-x86_64.iso)
参数解释：

    -hda : 启动的虚拟硬盘
    -cdrom : 启动的光盘镜像文件(相当于用光盘安装windows)
    -boot : 启动槽位，选d (我也不是太清楚)
    -m : 内存大小，单位mb
    -nographic : 无图像模式，直接在控制台输出
    --vnc :1 : 以vnc为图像模式输出到”显示器”，并占用vnc 1端口

先使用-nographic模式启动(旧手机 超慢 另外建议手机上操作 接个外接键盘 好很多 ssh连接操作可能无法查找到sda )，若长时间没出现alpine bootlog这界面，则先按CTRL+X+A结束进程(或用htop杀掉qemu进程)，再用--vnc :1 vnc图像模式启动
==================/========
Welcome to Alpine Linux 3.10
Kernel 4.19.58-0-virt on an x86_64 (/dev/ttyS0)

localhost login:
=================\=========

安装Alpine到虚拟硬盘

使用root账户登录 配置网络：


vi /etc/network/interfaces


添加：

auto lo

iface lo inet loopback

auto eth0

iface eth0 inet dhcp


Esc :wq保存退出 重启网络：

/etc/init.d/networking restart

==================/=============

localhost:~# vi /etc/network/interfaces

localhost:~# /etc/init.d/networking restart
 * Starting networking ...
 *   lo ...
 [ ok ]
 *   eth0 ...
udhcpc: started, v1.30.1
udhcpc: sending discover
udhcpc: sending select for 10.0.2.15
udhcpc: lease of 10.0.2.15 obtained, lease time 86400
 [ ok ]
localhost:~#
==================/=============

设置软件源：

setup-alpine



详细配置：

    Select keyboard layout: cn (选择CN键盘布局)
    Select variant (cn)
    Enter system hostname: stageguard (输入hostname名称，随意)
    Which one do you want to initialize? (or '?' or 'done') [eth0]
    Ip address for eth0? (or 'dhcp', 'none', '?') [10.0.2.15] dhcp (选dhcp)
    Changing password for root (修改root用户密码)
    Which timezone are you in? ('?' for list) [UTC] Asia/Shanghai (时区填Asia/Shanghai)
    HTTP/FTP proxy URL? (e.g. 'http://proxy:8080', or 'none') [none] (代理地址，默认none)
    Enter mirror number (1-47) or URL to add (or r/f/e/done) [f]: 21 (选择软件源，21(清华源))
    Which SSH server? ('openssh', 'dropbear' or 'none') [openssh] (SSH服务器，选择openssh(默认))
    Which disk(s) would you like to use? (or '?' for help or 'none') [none]sda (安装在何处，选sda)
    How would you like to use it? ('sys', 'data', 'lvm' or '?' for help) [?] sys (安装方式，选sys)
    WARNING: Erase the above disk(s) and continue? [y/N]: y (清除整个硬盘，y(是))

若出现网络问题：

应该是默认dns服务器异常。
编辑/etc/resolv.conf
将10.0.2.3改为8.8.8.8即可
vi /etc/resolv.conf

安装完成，关闭虚拟机

![图片](https://user-images.githubusercontent.com/75330257/113530051-a5706780-95f7-11eb-9fec-ad81958c90f3.png)



启动Alpine并安装docker:
qemu-system-x86_64 -hda virt-alpine.img -boot c -m 512 -netdev user,id=nde1,hostfwd=tcp::2222-:22 -device e1000,netdev=nde1,id=d-net1 -nographic

参数解释：

    -hda : 启动的虚拟硬盘
    -boot : 启动槽位，选c (我也不是太清楚)
    -m : 内存大小，单位mb
    -netdev : 网络配置
    -device : 设备配置(当前指向网络设备)
    -nographic : 无图像模式，直接在控制台输出
    --vnc :1 : 以vnc为图像模式输出到”显示器”，并占用vnc 1端口

    -netdev参数中的hostfwd可以映射网络，当前配置会将虚拟机中22(SSH默认)端口映射到物理网络的2222端口上
    
![图片](https://user-images.githubusercontent.com/75330257/113530152-e23c5e80-95f7-11eb-8170-7c8aff8f4d2d.png)




配置SSHD:

vi /etc/ssh/sshd_config

取消注释PermitRootLogin并修改为yes

重启sshd


现在外部ssh就可以登录alpine的root账户了


在Termux中：

ssh root@localhost -p 2222


添加community源:
在alpine中，docker在其comminuty源里

vi /etc/apk/repositories

取消注释comminuty源

修改完成后，执行：
apk update
安装docker:

apk add docker

修改docker为开机(虚拟机)启动，启动docker:
#使docker开机启动
rc-update add docker


#开启docker服务
service docker start


#后台启动
setsid containerd


setsid dockerd

查看docker是否安装成功：

docker info


显示docker版本 完成安装


==================================================//

