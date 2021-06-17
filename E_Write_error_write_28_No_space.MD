# E: Write error - write (28 No space left on device)

*1* 在终端中运行命令，提示：

    e: Write error - write (28 No space left on device)

    E: Cant mmap an empty file

*2* 使用 df -h 查看磁盘空间情况：

    Filesystem                         Size  Used Avail Use% Mounted on
    udev                               965M     0  965M   0% /dev
    tmpfs                              200M  3.6M  196M   2% /run
    /dev/mapper/ubuntu--vg-ubuntu--lv   48G   48G     0 100% /
    tmpfs                              997M     0  997M   0% /dev/shm
    tmpfs                              5.0M     0  5.0M   0% /run/lock
    tmpfs                              997M     0  997M   0% /sys/fs/cgroup
    /dev/loop0                          33M   33M     0 100% /snap/snapd/12057
    /dev/loop1                          56M   56M     0 100% /snap/core18/1997
    /dev/loop2                         132M  132M     0 100% /snap/docker/796
    /dev/loop3                          33M   33M     0 100% /snap/snapd/12159
    /dev/loop4                          56M   56M     0 100% /snap/core18/2066
    /dev/sda2                          976M  149M  760M  17% /boot
    tmpfs                              200M     0  200M   0% /run/user/0


*3* 继续查看大文件所在目录：#du --max-depth=1 -h  /

    # du --max-depth=1 -h  /
    1.3G    /usr
    16K     /lost+found
    147M    /boot
    366M    /home
    881M    /lib
    5.6M    /etc
    0       /proc
    44G     /var
    111M    /root
    252K    /mnt
    3.6M    /run
    4.0K    /srv
    4.0K    /media
    15M     /bin
    104K    /.git
    1.1G    /snap
    4.0K    /cdrom
    4.0K    /opt
    36K     /tmp
    2.4M    /pagermaid
    0       /dev
    16M     /sbin
    0       /sys
    4.0K    /lib64
    50G     /

*4* 依次查看占用空间大的目录 直至找到占用大的文件 并删除
    du --max-depth=1 -h  /var 
    du --max-depth=1 -h  /var/log
    ...
    rm -rf XXX.log

此时基本恢复

*5* 清理升级缓存及无用包 可做日常清理

    sudo apt-get autoclean

    sudo apt-get clean

    sudo apt-get autoremove

*6* 进入到/boot目录下

    cd /boot
    查看自己系统已经安装的内核版本，下图是我自个已安装的内核版本。
    sudo dpkg --get-selections |grep linux-image
    查看正在使用的内核版本
    sudo uname -a
    删除旧的内核版本
    内核版本显示为install，表示系统已经安装了相应的内核，使用purge命令删除相应的内核
    sudo apt purge linux-image-4.15.0-140-generic

