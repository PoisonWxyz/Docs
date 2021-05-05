ifconfig参数

-a 显示全部接口信息
	root@PoisonW:/# ifconfig -a
	enp0s3: flags=4419<UP,BROADCAST,RUNNING,PROMISC,MULTICAST>  mtu 1500
	        inet 192.168.10.202  netmask 255.255.255.0  broadcast 192.168.10.255
	        inet6 fe80::a00:27ff:febc:4068  prefixlen 64  scopeid 0x20<link>
	        ether 08:00:27:bc:40:68  txqueuelen 1000  (Ethernet)
	        RX packets 132991  bytes 86829278 (82.8 MiB)
	        RX errors 0  dropped 0  overruns 0  frame 0
	        TX packets 73175  bytes 13137262 (12.5 MiB)
	        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

	enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
	        inet 192.168.56.102  netmask 255.255.255.0  broadcast 192.168.56.255
	        inet6 fe80::a00:27ff:fe78:76c3  prefixlen 64  scopeid 0x20<link>
	        ether 08:00:27:78:76:c3  txqueuelen 1000  (Ethernet)
	        RX packets 15992  bytes 1550956 (1.4 MiB)
	        RX errors 0  dropped 0  overruns 0  frame 0
	        TX packets 6044  bytes 1022821 (998.8 KiB)
	        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

	lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
	        inet 127.0.0.1  netmask 255.0.0.0
	        inet6 ::1  prefixlen 128  scopeid 0x10<host>
	        loop  txqueuelen 1  (Local Loopback)
	        RX packets 15273888  bytes 1929203265 (1.7 GiB)
	        RX errors 0  dropped 0  overruns 0  frame 0
	        TX packets 15273888  bytes 1929203265 (1.7 GiB)
	        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

-s 显示摘要信息
	root@PoisonW:/# ifconfig -s
	Iface      MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
	enp0s3    1500   133056      0      0 0         73204      0      0      0 BMPRU
	enp0s8    1500    15995      0      0 0          6048      0      0      0 BMRU
	lo       65536 15278612      0      0 0      15278612      0      0      0 LRU

启动或关闭指定网卡
	ifconfig eth0 up
	ifconfig eth0 down
	ifup eth0
	ifdown eth0

-promisc 设置是否支持网卡的promiscuous模式


如果选择此参数，网卡将接收网络中发给它所有的数据包

	ifconfig eth0 promisc  ／／设置
	ifconfig eth0 -promisc ／／取消

-allmulti 设置是否支持多播模式

	ifconfig eth0 allmulti  ／／设置
	ifconfig eth0 -allmulti ／／取消

如果选择此参数，网卡将接收网络中所有的多播数据包

配置IP地址

    ifconfig eth0 192.168.120.56 
	ifconfig eth0 192.168.120.56 netmask 255.255.255.0 
	ifconfig eth0 192.168.120.56 netmask 255.255.255.0 broadcast 192.168.120.255

单网卡添加多个IP地址

	ifconfig eth0:0 192.168.0.1 netmask 255.255.255.0 up
	ifconfig eth0:1 192.168.0.2 netmask 255.255.255.0 up

删除IP地址

	ifconfig eth0 del 192.168.227.188

启用或关闭arp协议

	ifconfig eth0 arp
	ifconfig eth0 -arp

设置最大传输单元

设置能通过的最大数据包大小为 1500 bytes

	ifconfig eth0 mtu 1500

用ifconfig修改MAC地址

	ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF
