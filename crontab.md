# crontab Linux设置定时任务    
*crond*是linux用来定期执行程序的命令，当系统安装完成后会默认启动此服务，crond会每  
分钟定期检查是否有需要执行的工作，通过status可查看此服务的运行状态  

# crond的基本命令：

`crond status：` # 查看crond服务状态  

`crond start：` # 启动crond服务  

`crond stop：` # 关闭crond服务  

`crond restart：` # 重启crond服务  

`crontab -u：` # 设定某个用户的crond服务  

`crontab -l：` # 列出某个用户的crond内容  

`crontab -r：` # 删除某个用户的crond服务  

`crontab -e：` # 编辑某个用户的crond服务内容  

*有时在启动crond时会出现  
`crond: can't lock /var/run/crond.pid, otherpid may be 15340: Resource temporarily unavailable`  
的提示，只需用killall crond结束所有crond服务再重新启动即可  

# crontab计划任务的语法为:  

* 秒      分     小时      日       月      星期      命令*

*0-59 0-59   0-23   1-31    1-12     0-6     command*    

	在以上各个字段中，还可以使用以下特殊字符：  
	星号(*)：代表所有可能的值，例如month字段如果是星号，则表示在满足其它字段的制约条件后每月都执行该命令操作
	逗号(,)：可以用逗号隔开的值指定一个列表范围，例如，“1,2,5,7,8,9”
	中杠(-)：可以用整数之间的中杠表示一个整数范围，例如“2-6”表示“2,3,4,5,6”
	正斜线(/)：可以用正斜线指定时间的间隔频率，例如“0-23/2”表示每两小时执行一次。同时正斜线可以和星号一起使用，例如*/10，如果用在minute字段，表示每十分钟执行一次  

# 添加计划任务有两种方式：  
`crontab -e` # 来进行添加  
`/etc/crontab` # 文件来进行添加  

# crond定时任务添加规范:  

*添加注释*  

	定时任务最好以脚本(.sh)的形式执行`  

	执行shell脚本任务前加/bin/sh`  

	所有路径都要写全路径(包括应用程序的路径)，比如要定时执行python程  
序，执行命令不能简单写作python ***.py，python程序的完整路径也要写编写执行  
脚本要注意不要和window混用，要在纯linux环境下编写，否则会因平台保存文件  
格式不同出现:  
`-bash: ./***.sh: /bin/bash^M: bad interpreter: No such file or directory`的错误  

编写好的执行脚本最好先在命令行验证一下，在添加进计划任务中定时任务命令或脚  
本结尾加>/dev/null 2>&1  

	/dev/null # 代表 linux 的空设备文件  
	执行了 `>/dev/null` 之后，标准输出就会不再存在  
  
	2>&1 # 重定向绑定  
  
	*>/dev/null    2>&1 VS 2>&1     >/dev/null*  
  
	命令		标准输出 	错误输出  
 

	>/dev/null    2>&1 	丢弃 	丢弃  

	2>&1    >/dev/null 	丢弃 	屏幕  

`>/dev/null    2>&1` # 常用来避免shell命令或者程序等运行中有内容输出  

*经常使用nohup command &命令形式来启动一些后台程序*  

`nohup command >/dev/null 2>&1 &` # 后台执行某程序并丢弃错误输出  
