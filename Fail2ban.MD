# Fail2ban

可通过监视服务日志中的恶意活动来帮助保护Linux机器免受暴力和其他自动攻击

如:当有人在试探你的HTTP、SSH、SMTP、FTP密码，只要达到你预设的次数，fail2ban就会调用防火墙屏蔽这个

IP，而且可以发送e-mail通知系统管理员

# 安装

    sudo apt update && apt upgrade

    sudo apt install fail2ban

    sudo systemctl status fail2ban #安装完成后，Fail2ban服务将自动启动 可检查服务状态来验证

    输出将如下所示：

    fail2ban.service - Fail2Ban Service

    Loaded: loaded (/lib/systemd/system/fail2ban.service; enabled; vendor preset: enabled)

    Active: active (running) since Thu 2021-07-08 09:52:55 UTC; 33s ago

    Docs: man:fail2ban(1)

    Main PID: 11111 (f2b/server)

    Tasks: 5 (limit: 11111)

    CGroup: /system.slice/fail2ban.service

    └─1251 /usr/bin/python3 /usr/bin/fail2ban-server -xf start

    systemd[1]: Starting Fail2Ban Service...

    systemd[1]: Started Fail2Ban Service.

    fail2ban-server[12551]: Server ready

    此时，您已在Ubuntu服务器上运行Fail2Ban

# 配置

对于大多数用户来说，配置Fail2ban的最简单方法是将复制jail.conf到jail.local并修改.local文件。更高

级的用户可以.local从头开始构建配置文件。该.local文件不必包括相应.conf文件中的所有设置，仅包括您要覆

盖的设置

.local从默认jail.conf文件创建配置文件：

    sudo cp /etc/fail2ban/jail.{conf,local}

要开始将Fail2ban服务器配置为打开，jail.local请使用文本编辑器打开该文件：

*将IP地址列入白名单*

您可以将要排除的IP地址，IP范围或主机添加到ignoreip指令中。在这里，您应该添加您的本地PC IP地址以及您要列入白名单的所有其他计算机。

取消以开头的行的注释，ignoreip并添加IP地址(以空格分隔)：

    ignoreip = 127.0.0.1/8 ::1 123.123.123.123 192.168.x.0/24

*禁止设置*

值bantime，findtime和maxretry选项定义禁令时间和禁止条件。

1.bantime禁止IP的持续时间。如果未指定后缀，则默认为秒。默认情况下，该bantime值设置为10分钟

通常大多数用户会希望设置更长的禁止时间。根据您的喜好更改值：

    bantime = 1d #要永久禁止IP，请使用负数


2.findtime是设置禁令前的失败次数之间的持续时间。例如，如果将Fail2ban设置为在5次失败之后禁止

IP(maxretry请参见下文)，则这些失败必须在findtime持续时间内发生

    findtime = 10m

3.maxretry是禁止IP之前的失败次数。默认值设置为5，这对于大多数用户来说应该没问题

    maxretry = 5

4.邮件通知

当IP被禁止时，Fail2ban可以发送电子邮件警报。要接收电子邮件，您需要在服务器上安装SMTP并更改默认操作

该操作仅将IP禁止为%(action_mw)s，如下所示：

    action = %(action_mw)s

%(action_mw)s将禁止违规的IP，并发送包含Whois报告的电子邮件。如果要在电子邮件中包含相关日志，请将操

作设置为%(action_mwl)s。

您还可以调整发送和接收电子邮件地址：

    destemail = admin@lgmail.com

    sender = root@gmail.com

*Fail2ban监狱*

Fail2ban使用监狱的概念。监狱描述了一项服务，其中包括过滤器和操作。对符合搜索模式的日志条目进行计数，

并在满足预定义条件时执行相应的操作。

Fail2ban附带有许多用于不同服务的监狱。您还可以创建自己的监狱配置。

默认情况下，仅启用ssh监狱。要启用监狱，您需要enabled = true在监狱标题后添加。

以下示例显示了如何启用proftpd监狱：

    [proftpd]

    port = ftp,ftp-data,ftps,ftps-data

    logpath = %(proftpd_log)s

    backend = %(proftpd_backend)s

例子：

    [sshd]

    enabled = true

    maxretry = 3

    findtime = 1d

    bantime = 4w

    ignoreip = 127.0.0.1/8 xx.xx.xx.xx

筛选器位于/etc/fail2ban/filter.d目录中，并存储在与监狱名称相同的文件中。如果您具有自定义设置并且对

正则表达式有经验，则可以对过滤器进行微调。

每次编辑配置文件时，都需要重新启动Fail2ban服务以使更改生效：

    sudo systemctl restart fail2ban

*Fail2ban客户端*

Fail2ban附带了一个名为的命令行工具fail2ban-client，可用于与Fail2ban服务进行交互。

要查看所有可用选项，请使用以下选项调用命令-h：

    fail2ban-client -h

此工具可用于禁止/取消禁止IP地址，更改设置，重新启动服务等等。以下是一些示例：

检查监狱状况：

    sudo fail2ban-client status sshd

取消IP：

    sudo fail2ban-client set sshd unbanip xx.xx.xx.xx

禁止IP：

    sudo fail2ban-client set sshd banip xx.xx.xx.xx

*防止SSH密码爆破*

[ssh-iptables]模块的配置修改如下

    [ssh-iptables]

    enabled  = true
    filter   = sshd
    action   = iptables[name=SSH, port=22, protocol=tcp]
    logpath  = /var/log/secure
    maxretry = 3
    findtime  = 300

*阻止恶意扫描*

新增[nginx-dir-scan]模块，配置信息如下。此处，port和logpath应按照实际情况填写

    [nginx-dir-scan]

    enabled = true
    filter = nginx-dir-scan
    action   = iptables[name=nginx-dir-scan, port=443, protocol=tcp]
    logpath = /path/to/nginx/access.log
    maxretry = 1
    bantime = 172800
    findtime  = 300



# Fail2ban常用命令

    systemctl start fail2ban #启动Fail2ban

    systemctl stop fail2ban #停止Fail2ban

    systemctl enable fail2ban #开机启动Fail2ban

    fail2ban-client status ssh-iptables #查看被ban IP，其中ssh-iptables为名称

    fail2ban-client set ssh-iptables addignoreip IP地址 #添加白名单

    fail2ban-client set ssh-iptables delignoreip IP地址 #删除白名单

    iptables -L -n #查看被禁止的IP地址

