# 甜糖&网心云

*甜糖*

*多开*

    docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

打开混杂(这步可以省略,如果不能正常工作再打开)

    ip link set eth0 promisc on

创建网络（自行替换网关以及网段）

    docker network create -d macvlan --subnet=192.168.50.0/24 --gateway=192.168.50.1 -o parent=eth0 -o macvlan_mode=bridge macnet

# 运行容器

    docker run -itd \
      -v /mnt/data/ttnode:/mnts \
      --name ttnode \
      --hostname ttnode1 \
      --net=macnet --ip=192.168.50.130 --dns=114.114.114.114 --mac-address 9B:15:10:CD:9F:05 \
      --privileged=true \
      --restart=always \
      ericwang2006/ttnode

# 直接主网络运行（替换路径）

    docker run -itd \
      -v /mnt/data/ttnode:/mnts \
      --name ttnode \
      --hostname ttnode \
      --net=host \
      --privileged=true \
      --restart=always \
      ericwang2006/ttnode


# docker-compose

`注意：网卡命名区别 如：eth0,ovs_eth0以及ens160等等， 可用ip route|grep default 查询`

    version: '2'

    services:     
      ttnode:
        image: ericwang2006/ttnode
        container_name: ttnode1
        hostname: ttnode1
        privileged: true
        restart: always
        mac_address: 9B:15:10:CD:9F:05
        dns: 114.114.114.114
        networks: 
          macvlan:
            ipv4_address: 192.168.50.130
        volumes:
        - /mnt/data/ttnode1:/mnts

    networks:
      macvlan:
        driver: macvlan
        driver_opts:
          parent: ens160
        ipam:
          config:
          - subnet: 192.168.50.0/24
              gateway: 192.168.50.1


    version: '2'

    services:     
      ttnode:
        image: ericwang2006/ttnode
        container_name: ttnode2
        hostname: ttnode2
        privileged: true
        restart: always
        mac_address: 82:8B:D0:ED:21:BF
        dns: 114.114.114.114
        networks: 
          macvlan:
            ipv4_address: 192.168.50.131
        volumes:
        - /mnt/data/ttnode2:/mnts

    networks:
      macvlan:
        driver: macvlan
        driver_opts:
          parent: ens160
        ipam:
          config:
          - subnet: 192.168.50.0/24
              gateway: 192.168.50.1

# NAS


    version: '2'

    services:     
      ttnode:
        image: ericwang2006/ttnode
        container_name: ttnode1
        hostname: ttnode1
        privileged: true
        restart: always
        mac_address: 9B:15:10:CD:9F:05
        dns: 114.114.114.114
        networks: 
          macvlan:
            ipv4_address: 192.168.50.130
        volumes:
        - /volume1/docker/ttnode1:/mnts

    networks:
      macvlan:
        driver: macvlan
        driver_opts:
          parent: ovs_eth0
        ipam:
          config:
          - subnet: 192.168.50.0/24
              gateway: 192.168.50.1


    version: '2'

    services:     
      ttnode:
        image: ericwang2006/ttnode
        container_name: ttnode2
        hostname: ttnode2
        privileged: true
        restart: always
        mac_address: 82:8B:D0:ED:21:BF
        dns: 114.114.114.114
        networks: 
          macvlan:
            ipv4_address: 192.168.50.131
        volumes:
        - /volume1/docker/ttnode2:/mnts

    networks:
      macvlan:
        driver: macvlan
        driver_opts:
          parent: ovs_eth0
        ipam:
          config:
          - subnet: 192.168.50.0/24
              gateway: 192.168.50.1

*网心云*

<a href="https://registry.hub.docker.com/r/onething1/wxedge" target="_blank">网心云</a>

安装激活

1.运行容器：

    docker run -d --name=wxedge --restart=always --privileged --net=host  --tmpfs /run --tmpfs /tmp -v /media/wxedge_storage:/storage:rw  onething1/wxedge

必选参数说明：

`--privileged 必须打开。`

`--net目前只支持host（推荐）和macvlan两种网络模式。`

`/media/wxedge_storage是磁盘的目录，必须挂载到容器内的/storage目录，至少需要50G以上的空间，建议是固态硬盘。`

# macvlan多实例

    docker network create -d macvlan \
      --subnet=192.168.50.0/24 \
      --gateway=192.168.50.1 \
      -o parent=eth0 \
      -o macvlan_mode=bridge \
      macnet

    docker run -itd \
      --name=wxedge1 \
      --net=macnet \
      --ip=192.168.50.130 \
      --privileged=true \
      --tmpfs /run \
      --tmpfs /tmp \
      -v /mnt/data/wxedge_storage1:/storage:rw \
      --restart=always \
      onething1/wxedge

    docker run -itd \
      --name=wxedge2 \
      --net=macnet \
      --ip=192.168.50.131 \
      --privileged=true \
      --tmpfs /run \
      --tmpfs /tmp \
      -v /mnt/data/wxedge_storage2:/storage:rw \
      --restart=always \
      onething1/wxedge


可选参数说明（建议新手都不要设置）：

-e NIC=eth0 有多网卡多线路时，可以使用该参数指定路由网卡，不配置会自动选默认路由网卡。

-e REC=false 第一次安装设置为false时，不会启动默认任务，默认为true。

-e LISTEN_ADDR="127.0.0.1:28888" 支持设置绑定页面的监听地址和端口，监听全地址设置-e LISTEN_ADDR=":28888"，默认监听全地址18888端口。多开容器也可以参考用该参数，比如容器A使用参数-e LISTEN_ADDR=":18888"，容器B使用参数 -e LISTEN_ADDR=":28888"

2.升级容器：

手动升级

    docker stop wxedge

    docker rm wxedge

    docker rmi onething1/wxedge

    docker run -d --name=wxedge --restart=always --privileged --net=host --tmpfs /run --tmpfs /tmp -v /media/wxedge_storage:/storage:rw onething1/wxedge

自动升级（containrrr/watchtower非网心云官方镜像，仅供参考，有问题请自行解决）

    docker run -d --name watchtower --restart always -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup wxedge

设备绑定

打开浏览器（推荐谷歌浏览器），输入局域网http://ip:18888（ip可以通过路由器管理终端页面查看到），比如http://192.168.1.10:18888

产品指南&教程

「产品指南」：

https://help.onethingcloud.com/caa9/a0fe/b6b3

「群晖安装激活教程」：

https://help.onethingcloud.com/7cb4/3ed5/9899

「koolshare安装激活教程」：

https://help.onethingcloud.com/7cb4/3ed5/a209

「树莓派&命令行安装激活教程」：

https://help.onethingcloud.com/7cb4/3ed5/8907

*关于网络限速*

# 适合单机玩多容器 重启失效 防失效写入配置 详见作者库 或./wondershaper -h

<a href="https://github.com/magnific0/wondershaper" target="_blank">限速</a>

`步骤如下：`

    git clone https://github.com/magnific0/wondershaper.git

    cd wondershaper

    ip addr show

    ./wondershaper -a eth0 -u 4096 -d 8192

`单位是kbps 此列限制上行4Mbps 下行Mbps`

*只限制上行*

    ./wondershaper -a eth0 -u 4096

*解除限速*

    ./wondershaper -c -a eth0

![图片](https://github.com/PoisonWxyz/Docs/blob/main/Images/hjevegvlh5ifes.jpg)

垃圾


![图片](https://github.com/PoisonWxyz/Docs/blob/main/Images/sfjahsfhlhhjdvhl.jpg)

公网


![图片](https://github.com/PoisonWxyz/Docs/blob/main/Images/psvhjcby683hvjh.jpg)

千兆 