# ubuntu 20.04 server 版设置静态 IP 地址

ubuntu 从 17.10 开始，已放弃在 /etc/network/interfaces 里固定 IP 的配置，interfaces 文件不复

存在，即使配置也不会生效，而是改成 netplan 方式 ，配置写在 /etc/netplan/01-netcfg.yaml 或者类似

名称的 yaml 文件里

*1.查看网卡设备号*

    ip a

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
    2: ens160: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether f8:77:19:f8:77:19 brd ff:ff:ff:ff:ff:ff
    inet 192.168.X.X brd 192.168.X.255 scope global ens160
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:fef8:fef8:fef8/64 scope link
       valid_lft forever preferred_lft forever

*2.修改 yaml 文件*

    sudo nano /etc/netplan/00-installer-config.yaml

    network:
  ethernets:
    ens160:     #配置的网卡的名称
      addresses: [192.168.X.X/24]    #配置的静态ip地址和掩码
      dhcp4: no    #关闭DHCP，如果需要打开DHCP则写yes
      optional: true
      gateway4: 192.168.X.1    #网关地址
      nameservers:
         addresses: [8.8.8.8,119.29.29.29]    #DNS服务器地址，多个DNS服务器地址需要用英文逗号分隔开
  version: 2
  renderer: networkd    #指定后端采用systemd-networkd或者Network Manager，可不填写则默认使用systemd-workd

*3.让配置生效*

    sudo netplan apply
