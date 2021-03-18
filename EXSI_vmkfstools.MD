vmkfstools 是 ESXi 集成的一个控制台工具。通过 SSH 进行操作即可
虚拟机扩容
移除虚拟机的快照，否则VMDK将出错，导致內部的资料丢失！
开启SSH
登录 vSphere Client
调整虚拟磁盘大小,定位到数据存储区：
cd /vmfs/volumes/datastore15e0c058a-95be1072-027d-c4834f10f528
查看存储区内的文件夹：
OpenWrt
定位到指定虚拟机的文件夹（区分大小写）：
cd /vmfs/volumes/datastore15e0c058a-95be1072-027d-c4834f10f528/OpenWrt
执行 vmkfstools ，并输入虚拟磁盘文件名以及参数-X，以及希望更改的磁盘容量大小（以G为单位），例如“vmkfstools myvm1.vmdk –X 32G”。当然也可以以K（Kilobytes）或者M（Megabytes）为单位更改磁盘容量的大小：
vmkfstools openwrt.vmdk -X 32G
============================/
