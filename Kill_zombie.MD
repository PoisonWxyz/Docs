如何查看僵尸进程

ps -A -ostat,ppid,pid,cmd | grep -e '^[zZ]'

如何杀死僵尸进程
sudo kill -9 PID
