Android_Termux
利用Termux搭建自己的Android移动工作站,启动SSH服务，安装,Pip,Java
一、安装Termux
直接googleplay下载安装

1.Termux特殊按键浮窗，用于手机上输入ctrl,esc等键，长按KEYBOARD选项可打开该功能
Termux维护着适合Android的库，并自带包管理器apt
2.软件下载地址
https://f-droid.org/packages/com.termux/

安装openssh,并从PC端访问
终端界面在手机上操作不方便，所以我们安装一个ssh服务，然后用PC来操作它

替换国内源

Termux 内置有apt包管理器，但是源需翻墙使用
# 设定vi编辑
export EDITOR=vi
# 打开源配置文件
apt edit-sources

替换文件内容为
deb http://mirrors.tuna.tsinghua.edu.cn/termux stable main



更新软件源
apt update
安装openssh-server
pkg install openssh

ssh免密登录

Termux终端中sshd服务支持密码和免密验证，这里为了以后登录方便直接采用复制秘钥到配置文件的免密登录方式，即将~/.ssh/isa_pub内容复制粘贴到手机home/.ssh/authorized_keys文件中
你也可以通过 passwd 命令，设定当前账户的密码（ssh密码不能为空,所以不设置无法登陆）
给termux对应的用户设置一个密码
$passwd
#根据提示设置一个密码
New password:
安装后，需要手动启动sshd
sshd &
注意：termux的ssh服务默认端口为8022

安装pip
$ wget https://bootstrap.pypa.io/get-pip.py
$ python get-pip.py
$ pip -V　　#查看pip版本

安装Java
# 安装java需要先安装ArchLinux环境
pkg install git
cd && git clone https://github.com/sdrausty/TermuxArch
bash TermuxArch/setupTermuxArch.sh
pacman -Syy; pacman -Su; pacman -S jdk8-openjdk

这里安装TermuxArch 在Android 8.0及以上有坑，可以去github问答区找解决方案
基本概念

1，Termux不是一个操作系统，它是Android的终端模拟器 - 是一个为shell提供基于文本的界面的应用程序
2，与传统的Linux发行版存在一些差异，不存在linux的常见文件夹（如/ bin，/ etc，/ usr，/ tmp，/ var）,无法安装其他Linux源里面的包
3, Termux作为没有root用户的单用户系统,在Termux中运行命令不会干扰其他已安装的应用程序


安装wget
pkg install wget

安装proot
在linux中，chroot是一个需要root权限的操作，它允许将当前根文件系统切换到另外一个目录。

例如手机中的进程对应的根目录为/, 我们弄一个/data/local/tmp/xxxx文件夹, 里边有ubuntu的根文件系统，我们chroot到这个文件夹后，在shell界面里看到的/则切换到/data/local/tmp/xxxx了

安装ubuntu
其实只是chroot到一个ubuntu的根文件系统文件夹里而已
proot是一个无需root权限就能执行chroot操作的工具。用于在ubuntu里模拟需要sudo的权限(否则没法安装软件)
pkg install proot

下载atilo脚本
wget https://raw.githubusercontent.com/YadominJinta/atilo/master/atilo

安装wget
pkg install wget


=============================================/
安装proot
在linux中，chroot是一个需要root权限的操作，它允许将当前根文件系统切换到另外一个目录。

例如手机中的进程对应的根目录为/, 我们弄一个/data/local/tmp/xxxx文件夹, 里边有ubuntu的根文件系统，我们chroot到这个文件夹后，在shell界面里看到的/则切换到/data/local/tmp/xxxx了

我们说的安装ubuntu其实只是chroot到一个ubuntu的根文件系统文件夹里而已
proot是一个无需root权限就能执行chroot操作的工具。用于在ubuntu里模拟需要sudo的权限(否则没法安装软件)
pkg install proot

下载atilo脚本
wget https://raw.githubusercontent.com/YadominJinta/atilo/master/atilo

下载ubuntu根文件系统并chroot

chmod +x ./atilo
./atilo install ubuntu

#这个命令会执行proot，chroot到所下载的ubuntu根文件系统
startubuntu

执行startubuntu后，根目变到 --> data/data/com.termux/files/home/.atilo/ubuntu去了, 我们就感觉进入了ubuntu系统了
=============================================/


