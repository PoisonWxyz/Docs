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
    sudo dpkg --gpket-selections |grep linux-image
    查看正在使用的内核版本
    sudo uname -a
    删除旧的内核版本
    内核版本显示为install，表示系统已经安装了相应的内核，使用purge命令删除相应的内核
    sudo apt purge linux-image-4.15.0-140-generic

# Df命令是linux系统以磁盘分区为单位查看文件系统


    df -hl 查看磁盘剩余空间

    df -h 查看每个根路径的分区大小

    du -sh [目录名] 返回该目录的大小

    du -sm [文件夹] 返回该文件夹总M数

    更多功能可以输入一下命令查看：

    df --help

    du --help
# ubuntu清理3天之前的日志

    find /var/log/ -type f -mtime +30 -exec rm -f {} \;

# 清理大于100m的日志

    #!/bin/sh
    #将/var/logs中的大于100M的文件删除
    maxSize=`expr 100 \* 1024 \* 1024`
    for file in $(ls /var/log)
    do
        if [ -f /var/log/$file ]; then
            if [ $(ls -l /var/log/$file|awk '{print $5}') -gt $maxSize ]; then
                echo /var/log/$file
                rm -rf /var/log/$file
            fi
        fi
    done

# 清理docker容器日志，注意里面路径换成自己的

    #!/bin/sh
    echo "======== start clean docker containers logs ========"
    logs=$(find /data/docker/containers/ -name *-json.log)
    for log in $logs
    do
    echo "clean logs : $log"
    cat /dev/null > $log
    done
    echo "======== end clean docker containers logs ========"
    echo `date`

# systemd journal之于systemd犹如syslog之于init，其日志文件保存在 /var/log/journal 目录下

清理之前，可查看一下systemd日志所占用的磁盘空间。既可以用常用的 du 命令：

    sudo du -sh /var/log/journal/
    # 示例输出
    # 3.9G /var/log/journal/
但更推荐使用systemd日志管理专用命令 journalctl：

    journalctl --disk-usage
    # 示例输出
    # Archived and active journals take up 3.9G on disk.
知道了日志占用的磁盘空间，接下来便可以清理过期日志。开始之前，建议 rotate 当前日志(rotate是日志操作中的一个术语，其归档旧日志，后续日志写入新创建的日志文件中)：

    sudo journalctl --rotate
    # journalctl提供了三种清理systemd日志的方式。

*第一种是清理指定时间之前的日志：*

    # 清理7天之前的日志
    sudo journalctl --vacuum-time=7d
    # 清理2小时之前的日志
    sudo journactl --vacuum-time=2h
    # 清理10秒之前的日志
    sudo journalctl --vacuum-time=10s
    # 上述命令示例输出：
    # Vacuuming done, freed 3.7G of archived journals on disk.
*第二种是限制日志占用的空间大小：*

    # 限制systemd日志占用不超过1G空间
    sudo journalctl --vacuum-size=1G
    # 限制systemd日志占用不超过100M
    sudo journalctl --vacuum-size=100M
    # 输出与第一种类似

*第三种是保留日志文件个数：*

    # 保留最近的5个日志文件
    sudo journalctl --vacuum-files=5
    # 输出与第一种类似
    # 删除7天前的日志
    find /var/log/journal -mtime +7 -exec rm -rf {} \;

# 配置systemd journal，让其自动管理日志，不占用过多磁盘空间。

方法是编辑/etc/systemd/journald.conf 文件，对其中的参数进行设置

    sudo cp /etc/systemd/journald.conf /etc/systemd/journald.conf.bak

    sudo nano /etc/systemd/journald.conf

例如限制日志最大占用1G空间：

    [Journal]
    #Storage=auto
    #Compress=yes
    #Seal=yes
    #SplitMode=uid
    #SyncIntervalSec=5m
    #RateLimitInterval=30s
    #RateLimitBurst=1000
    SystemMaxUse=1G
    #SystemKeepFree=
    #SystemMaxFileSize=
    #RuntimeMaxUse=
    #RuntimeKeepFree=
    #RuntimeMaxFileSize=

保存配置文件后记得重新加载：

`sudo systemctl restart systemd-journald`

*可以通过shell脚本+crontab定时任务的方式，定期自动清理这些文件以腾出磁盘空间*

# autoCleanLog.sh

    #!/bin/bash
    find /var/log/ -mtime +10 -type f -name "*.log" | xargs rm -f

`find /var/log/`

需要操作的目录

`-mtime +10`

只保留最近十天，或者操作针对于十天之前的文件，在这就是删除十天之前的文件

`-type f`

指定操作类型为文件，文件为f，目录为d

`-name “*.log”`

指定操作的文件是什么，在这里我们仅操作指定目录下以.log结尾的文件，根据具体的需求修改

    chmod +x autoCleanLog.sh

    ./autoCleanLog.sh

*计划任务*

    crontab -e

autoCleanLog.sh加入到系统计划任务，到点自动执行

    30 3 * * * /autoCleanLog.sh

根据shell文件实际存储目录，文件名 自行更改

du -s /tmp/*|sort -nr|head -3