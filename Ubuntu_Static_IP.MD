ubuntu18.04配置静态ip

查找netplan目录下默认的网络配置文件，文件后缀为.yaml，我的是叫01-network-manager-all.yaml的文件。如果没有可以使用sudo gedit 01-network-manager-all.yam自己创建

	cd /etc/netplan

	ls

编辑网络配置文件之前，先查看自己的网卡名称

	ifconfig

编辑网络配置文件00-network-manager-all.yaml
（配置文件的每一行都必须靠空格来缩进，不能用 TAB 来代替，否则配置会不起作用）

	network:
	  version: 2
	  renderer: NetworkManager
	  ethernets:
	     enp3s0: #配置的网卡名称,使用ifconfig -a查看得到
	       dhcp4: no #dhcp4关闭
	       addresses: [192.168.202.36/24] #设置本机IP及掩码
	       gateway4: 192.168.202.1 #设置网关
	       nameservers:
 	       addresses: [192.168.202.1] #设置DNS

使用命令，使静态ip生效

	sudo netplan apply
如果在应用配置的时候有出现问题的话，可以通过如下的命令来查看刚才配置的内容出了什么问题

	sudo netplan --debug apply
