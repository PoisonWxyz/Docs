Android_Termux 

利用Termux搭建自己的Android移动工作站,启动SSH服务，安装,Pip,Java 

一、安装Termux 
直接googleplay下载安装

1.Termux特殊按键浮窗，用于手机上输入ctrl,esc等键，长按KEYBOARD选项可打开该功能 Termux维护着适合Android的库，并自带包管理器apt 
2.软件下载地址 https://f-droid.org/packages/com.termux/

安装openssh,并从PC端访问 终端界面在手机上操作不方便，所以我们安装一个ssh服务，然后用PC来操作它

替换国内源

Termux 内置有apt包管理器，但是源需翻墙使用
设定vi编辑

export EDITOR=vi
打开源配置文件

apt edit-sources

替换文件内容为 deb http://mirrors.tuna.tsinghua.edu.cn/termux stable main

更新软件 apt update 安装openssh-server pkg install openssh

ssh免密登录

whoami找到本机用户名 这个具体到每台不一样，我的是u0_a101

Termux终端中sshd服务支持密码和免密验证，这里为了以后登录方便直接采用复制秘钥到配置文件的免密登录方式，即将~/.ssh/isa_pub内容复制粘贴到手机home/.ssh/authorized_keys文件中 
你也可以通过 passwd 命令，设定当前账户的密码（ssh密码不能为空,所以不设置无法登陆） 给termux对应的用户设置一个密码 
$passwd #根据提示设置一个密码 
New password: 安装后，需要手动启动sshd 
sshd & 
注意：termux的ssh服务默认端口为8022 #-p

PC端通过ssh连接手机 ssh u0_a101@192.168.50.47 -p 8022

安装pip $ wget https://bootstrap.pypa.io/get-pip.py 
$ python get-pip.py 
$ pip -V　　#查看pip版本

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 安装Java
安装java需要先安装ArchLinux环境

1 pkg install git 
2 cd && git clone https://github.com/sdrausty/TermuxArch 
3 bash TermuxArch/setupTermuxArch.sh 
也可以用网页去下载: 
1 pkg install wget 
2 wget https://sdrausty.github.io/TermuxArch/setupTermuxArch.sh 
3 bash setupTermuxArch.sh 
执行setupTermuxArch.sh这个脚本以后就可以进入安装过程了 
安装过程中需要几次确认，一路确认yes就安装好了 
1 pacman -Syy; pacman -Su; pacman -S jdk8-openjdk 
2 JAVA就安装好了

-----------------------------------------------------?/ 
chmod +x setupTermuxArch.sh ./setupTermuxArch.sh

-----------------------------------------------------?/

这里安装TermuxArch 在Android 8.0及以上有坑，可以去github问答区找解决方案 基本概念 
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
另一种：Alpine Linux系统镜像 
Small. Simple. Secure. Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox. 
使用Alpine的原因： 体积占用小，完全安装后的镜像不到1gb 安装快 内存占用小，idle状态仅占用30多MB内存 
standard-x86_64: alpine-standard-3.10.1-x86_64.iso(v3.10.1, OfficialSite)，
或者在Termux中： 
wget http://dl-cdn.alpinelinux.org/alpine/v3.10/releases/x86_64/alpine-standard-3.10.1-x86_64.iso virtual-x86_64: alpine-virt-3.10.1-x86_64.iso(v3.10.1, OfficialSite)，
或者在Termux中：
wget http://dl-cdn.alpinelinux.org/alpine/v3.10/releases/x86_64/alpine-virt-3.10.1-x86_64.iso

VNC Viewer (可选因为qemu有不输出图像模式(-nographic)，直接在termux控制台输出，不需要”显示器”，但是有可能翻车。)

用来连接qemu虚拟机的”显示器”，还可以连接蓝牙/OTG鼠标和键盘，非常强大 安装依赖

在Termux中：

1，Termux不是一个操作系统，它是Android的终端模拟器 - 是一个为shell提供基于文本的界面的应用程序 2，与传统的Linux发行版存在一些差异，不存在linux的常见文件夹（如/ bin，/ etc，/ usr，/ tmp，/ var）,无法安装其他Linux源里面的包 3, Termux作为没有root用户的单用户系统,在Termux中运行命令不会干扰其他已安装的应用程序

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
使用screen 来守护进程，有时候你可不小心断开终端丢失会话编译就会中断。
安装screen: 
sudo apt install screen 
screen 使用很简单
-S命令创建一个会话： 
screen -S openwrt 
按住键盘上 Ctrl +A +D 挂载到后台
查看后台的会话： screen -ls 
执行上面的命令你会看到我们挂载到后台的openwrt会话
切换到openwrt会话： 
screen -r openwrt 
如果你只有一个会话可以省略后面的openwrt，默认进入第一个。

用法 Ctrl+a 然后按c 建立一个新的screen 会话 
Ctrl+a 然后按n 跳转到下一个screen 会话 
Ctrl+a 然后按p 返回到上一个screen 会话 
Ctrl+a 然后按d 将当前的screen 会话放在背景执行 // 返回到最开始的工作环境 
Ctrl+a 然后按(大写)S 分离一个screen 会话出来，分离后用Ctrl+a 然后按tab键 在分离出来的各screen间跳转。
screen -ls 列出当前所有的screen会话 
screen -r 进程号 之前Ctrl+a 然后按d 放在背景执行的会话 呼叫回来。 
ssh中如果发生了突然断线 那么你重新登陆后 screen -ls 会发现 有screen的状态是处于(Attached)状态 此刻我们使用 screen -d 将他强行放到背景，然后再用screen -r 进程号将他呼叫回来。 
如果 screen -ls 看到有死亡的会话 可以用screen -wipe 进程号 将他杀掉 
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

安装wget pkg install wget

安装proot 在linux中，chroot是一个需要root权限的操作，它允许将当前根文件系统切换到另外一个目录。

例如手机中的进程对应的根目录为/, 我们弄一个/data/local/tmp/xxxx文件夹, 里边有ubuntu的根文件系统，我们chroot到这个文件夹后，在shell界面里看到的/则切换到/data/local/tmp/xxxx了

proot 是一个能在用户空间内运行的程序, 功能类似于chroot, mount --bind和 binfmt_misc , 能让root用户使用备用根目录运行程序, 就像chroot "jail"一样。 PRoot在由于缺少root权限而无法使用chroot的情况下尤其有用 安装完成之后, PRoot不需要root权限。 
和chroot一样, 你必须为PRoot提供一个新目录作为新的根目录。 如果没有指定shell程序，PRoot默认将启动/bin/sh。 虚拟文件系统无需手动挂载，PRoot会自动处理这个问题 与chroot一样，PRoot仅提供文件系统级隔离。 PRoot "jail" 中的程序共享相同的内核，硬件，进程空间和网络子系统。 
chroot和PRoot并不是如同虚拟机管理程序或半虚拟化程序的，真正的虚拟化程序替代品

安装ubuntu 其实只是chroot到一个ubuntu的根文件系统文件夹里而已 chroot命令用来在指定的根目录下运行指令。chroot，即 change root directory （更改 root 目录）。在 linux 系统中，系统默认的目录结构都是以/，即是以根 (root) 开始的。而在使用 chroot 之后，系统的目录结构将以指定的位置作为/位置 
proot是一个无需root权限就能执行chroot操作的工具。用于在ubuntu里模拟需要sudo的权限(否则没法安装软件) pkg install proot

下载atilo脚本 wget https://raw.githubusercontent.com/YadominJinta/atilo/master/atilo

使用方法

atilo [命令] [参数]

Atilo 是一个用来帮助你在termux上安装不同的GNU/Linux发行版的bash脚本。 命令: list 列出可用的和已安装的发行版 remove 移除已安装的发行版 install 安装发行版 help 帮助

安装wget pkg install wget

=============================================/ 
安装proot 在linux中，chroot是一个需要root权限的操作，它允许将当前根文件系统切换到另外一个目录。

例如手机中的进程对应的根目录为/, 我们弄一个/data/local/tmp/xxxx文件夹, 里边有ubuntu的根文件系统，我们chroot到这个文件夹后，在shell界面里看到的/则切换到/data/local/tmp/xxxx了

我们说的安装ubuntu其实只是chroot到一个ubuntu的根文件系统文件夹里而已 proot是一个无需root权限就能执行chroot操作的工具。用于在ubuntu里模拟需要sudo的权限(否则没法安装软件) pkg install proot

下载atilo脚本 wget https://raw.githubusercontent.com/YadominJinta/atilo/master/atilo

下载ubuntu根文件系统并chroot chroot命令用来在指定的根目录下运行指令。chroot，即 change root directory （更改 root 目录）。在 linux 系统中，系统默认的目录结构都是以/，即是以根 (root) 开始的。而在使用 chroot 之后，系统的目录结构将以指定的位置作为/位置

chmod +x ./atilo ./atilo install ubuntu

#这个命令会执行proot，chroot到所下载的ubuntu根文件系统 startubuntu

执行startubuntu后，根目变到 --> data/data/com.termux/files/home/.atilo/ubuntu去了, 我们就感觉进入了ubuntu系统了 
=============================================/
