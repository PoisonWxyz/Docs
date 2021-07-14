# E_Write_error_write_28_No_space.MD 续

# systemd-journald是一个改进型日志管理服务，可以收集来自内核、系统早期启动阶段的日志、系统守护进程在启动和运行中的标准输出和错误信息，还有syslog的日志

# 查看垃圾文件的方法

未清理前发现硬盘根分区空间告急，用 du -t 100M /var 或 journalctl --disk-usage 命令查看，发现

/var/log/journal日志文件占用了近3G空间，每个日志文件体积高达8-128M，这些日志文件记录了很长时间以来

的systemd情况，毫无价值，用journalctl --vacuum-size=10M命令将其清理之后，腾出了2.7G的空间。

用`df -h`命令一查，／根分区大小

# 查看某个目录的文件大小并排序（单位为MB）

    du -hm --max-depth=1 /var/ | sort -n

# 清空 /var/log/journal 文件的方法

1.用echo命令，将空字符串内容重定向到指定文件中

    echo "" > system.journal #说明：此方法只会清空一次

2.journalctl 命令自动维护文件大小

    journalctl --vacuum-time=1w #只保留近一周的日志

    journalctl --vacuum-size=500M #只保留500MB的日志

3.直接删除 /var/log/journal/ 目录下的日志文件

    systemctl restart systemd-journald.service #删除之前的日志，并重启 journalctl 服务

    rm -rf /var/log/journal/XXXXXXX #XXXXXXX 替换实际目录

# 使用 journalctl 观察日志信息

    journalct [-nrpf] [--since TIME] [--until TIME] _optional

    选项与参数：
    	预设会显示全部的 log 内容，从旧的输出到最新的信息
    	-n：显示最近 n 行的信息，找最新信息时有用
    	-r：反向输出，从最新的输出到最旧的输出
    	-p：显示后面接的信息重要性排序，前一章讲解的日志级别
    	-f：类似 tail -f 功能，持续显示 journal 日志内容
    	--since --unitl：设置开始与结束时间，只显示某段时间范围内的数据
    	_SYSTEMD_UNIT=unit.service：只输出某个服务的信息
    	_COMM=bash：只输出与 bash 有关的信息
    	_PID=pid：只输出某个 PID 的信息
    	_UID=uid：只输出某个 uid 的信息
    	SYSLOG_FACILITY=[0-23]：使用 syslog.h 规范的服务相对应的序号来显示指定数据

# logger 指令的应用

journalctl 指令是查阅信息，可以通过 logger 把你的数据存储到文件中，下面介绍最简单的本机信息传递，更多的方法请自行查阅 man logger

    `logger [-p 服务名称.等级] "信息"`
