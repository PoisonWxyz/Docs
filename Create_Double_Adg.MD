双AdGuard Home

因为是双 ADG 所以需要两个工作目录和配置文件夹:

sudo mkdir -p /home/AdGuardHome/work1 /home/AdGuardHome/work2 /home/AdGuardHome/conf1 /home/AdGuardHome/conf2

创建第一个容器


docker run -d --name adg1 \
    -v /home/AdGuardHome/work1:/opt/adguardhome/work \
    -v /home/AdGuardHome/conf1:/opt/adguardhome/conf \
    --net=host \
    --restart=always \
    adguard/adguardhome:latest
    


以下为第一个容器的创建命令，创建成功后前往浏览器输入路由器的 ip:3000 进行配置 初始化配置很简单，只要注意网页管理界面端口填写 3001，DNS 服务器端口填写 5334，防止冲突即可
AdGuardHome 的默认网页管理入口是 3000，如果不修改，创建第二个容器会出现问题

![image](https://user-images.githubusercontent.com/75330257/116136852-74bab400-a705-11eb-8c6e-408ed72a9b5a.png)



以下是第二个容器的创建命令，网页管理界面入口和第一个相同 进入初始化配置时网页管理页面端口改成 3002 即可

docker run -d --name adg2 \
    -v /home/AdGuardHome/work2:/opt/adguardhome/work \
    -v /home/AdGuardHome/conf2:/opt/adguardhome/conf \
    --net=host \
    --restart=always \
    adguard/adguardhome:latest


负载均衡：使用加权随机算法来选择最快的服务器。用到了算法，这就很玄学了。实际其实就是随机选择一个上游 DNS 服务器中的一个进行解析请求，哪个延迟低就更偏向于用哪一个。
并行请求：同时请求所有上游 DNS 服务器，取最快给出的响应结果，所以解析速度很快。在上游 DNS 服务器设置合理的情况下属于万金油方案，解析速度和访问速度都很快。所以也非常适合上游 DNS 服务器连接延迟大和不稳定的情况，就比如科学魔法爱国上网使用场景。
最快的 IP 地址：同时请求所有上游 DNS 服务器，在所有响应结果中选出延迟最低且可用的 IP。因为要等待所有上游 DNS 服务器响应结果，而且还要测试 IP 延迟及可用性，所以解析速度会很慢。只适合上游 DNS 服务器延迟特别低且网络非常稳定的场景，否则实际使用中可能会遇到首次打开网页非常慢，甚至可能打不开，要多刷新几次。再者低延迟 IP 不一定速度就快，还要看实际负载情况，所以这个方案的实际可用性是最差的

中国大陆不推荐使用任何海外的 DNS ，因为延迟很高且都受到了不同程度的干扰，可用性不高，强行设置只会得到减速效果或者报错

tls://dns.pub

https://dns.pub/dns-query

tls://dns.alidns.com

https://dns.alidns.com/dns-query

119.29.29.29

121.28.28.28

223.5.5.5

225.6.6.6

![image](https://user-images.githubusercontent.com/75330257/116141148-e2b5aa00-a70a-11eb-871e-2199f97d0fe8.png)


![image](https://user-images.githubusercontent.com/75330257/116141189-ef3a0280-a70a-11eb-80af-73a5b16b12f0.png)


国际网络环境，比如海外的 VPS 或者给科学魔法爱国上网软件做 DNS ，则推荐使用 Google 和 Quad9 的公共 DNS。给科学魔法爱国上网软件使用的前提是它们必须在魔法名单中

tls://dns.google

https://dns.google/dns-query

tls://dns11.quad9.net

https://dns11.quad9.net/dns-query

![image](https://user-images.githubusercontent.com/75330257/116141428-3d4f0600-a70b-11eb-9410-816667dad358.png)


8.8.8.8

10.8.4.4

12.9.9.11

149.112.112.11

 ![image](https://user-images.githubusercontent.com/75330257/116141363-26101880-a70b-11eb-9ecb-45183e247208.png)

![image](https://user-images.githubusercontent.com/75330257/116142898-0548c280-a70d-11eb-813b-fd4fe623dee3.png)

<a href="https://gitee.com/halflife/list/raw/master/ad.txt" target="_blank">HalfLife gitee</a>
<a href="https://raw.githubusercontent.com/Moexin/AdGuardHome/main/Halflife.list" target="_blank">HalfLife github</a>

规则合并自 EasylistChina、EasylistLite、CJX’sAnnoyance 合并规则（几乎每天更新)

![image](https://user-images.githubusercontent.com/75330257/116248068-142b8580-a79e-11eb-96d9-116c911f4ba1.png)

![image](https://user-images.githubusercontent.com/75330257/116248135-24436500-a79e-11eb-8dde-dd414d1b6b82.png)


![image](https://user-images.githubusercontent.com/75330257/116248180-32918100-a79e-11eb-9616-b71ebbad6b32.png)

EasyList

    EasyList

    可从国际网页上删除大部分广告，包括不需要的框架，图像和对象

https://easylist-downloads.adblockplus.org/easylist.txt

    EasyList China

    EasyList的中文补充过滤器

https://easylist-downloads.adblockplus.org/easylistchina.txt

    EasyPrivacy

    可选的补充过滤器列表，该列表从网络删除了所有形式的跟踪，包括Web错误，跟踪脚本和信息收集器，从而保护您的个人数据

https://easylist-downloads.adblockplus.org/easyprivacy.txt

    EasyList Cookie List

    阻止cookie横幅，GDPR覆盖窗口和其他与隐私相关的通知

https://easylist-downloads.adblockplus.org/easylist-cookie.txt

Anti-AD

    使用anti-AD能够屏蔽广告域名，能屏蔽电视盒子广告，屏蔽app内置广告，同时屏蔽了
    
    一些日志收集，大数据统计等涉及个人隐私信息的站点，能够保护个人隐私不被偷偷上传

https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-easylist.txt

CJX's Annoyance List

    “ EasyList China + EasyList” 和 “ EasyPrivacy” 的补充，删除了中文网站上的烦人的自我推广

https://raw.githubusercontent.com/cjx82630/cjxlist/master/cjx-annoyance.txt

I don't care about cookies

    可从几乎所有网站上删除Cookie警告，并为您节省数千次不必要的点击！

https://www.i-dont-care-about-cookies.eu/abp/

Zhihu Filter

    去除开屏、时间轴、首页推荐、回答列表、回答底部及评论区广告，个人中心VIP横幅
    去除知乎会员推荐的内容（Strict）

# Basic
https://raw.githubusercontent.com/zsakvo/AdGuard-Custom-Rule/master/rule/zhihu.txt

# Strict
https://raw.githubusercontent.com/zsakvo/AdGuard-Custom-Rule/master/rule/zhihu-strict.txt

Hosts Filter

    1024_hosts

    屏蔽一些1024站的弹窗广告和辣鸡澳门赌场的广告

https://raw.githubusercontent.com/Goooler/1024_hosts/master/hosts

    AdAway

    阻止移动广告提供商和一些分析提供商

https://adaway.org/hosts.txt

    ad-wars

    屏蔽一些中国视频网站的广告

https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts

    Google hosts

    提高网站访问速度

https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts

    Hblock

    通过阻止广告，跟踪和恶意软件域来提高安全性和隐私性

https://hblock.molinero.dev/hosts 

    Mvps

    您可以使用此文件来阻止广告，横幅，第三方Cookie，第三方页面计数器，网络错误，甚至是大多数劫持和可能有害的程序

http://winhelp2002.mvps.org/hosts.txt

    neoHosts

    屏蔽 JS Miner 挖矿、百度全家桶的全天候定位记录、各类统计服务（仅屏蔽 JS、不屏蔽控制台）、常见
    
    下载劫持、360 和百度的部分软件下载、CNNIC 根证书劫持、法轮功、ISIS、银河联邦等可能令人反感的激进宗教内容网站

# Basic 
https://cdn.jsdelivr.net/gh/neoFelhz/neohosts@gh-pages/basic/hosts.txt 

# Full
https://cdn.jsdelivr.net/gh/neoFelhz/neohosts@gh-pages/full/hosts.txt 

    StevenBlack

    整合和扩展来自多个精心策划的来源的hosts文件。您可以选择扩展，以阻止色情，社交媒体和其他类别。

https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

    yhosts

    屏蔽绝大多数中国网站以及APP的广告

https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts.txt

    YousList

    屏蔽韩国网站广告

https://raw.githubusercontent.com/yous/YousList/master/hosts.txt



<a href="https://www.leeyiding.com/archives/50/" target="_blank">AdGuard 语法规则——如何创建属于你自己的广告过滤器</a>

<a href="https://kb.adguard.com/en" target="_blank">This section describes general issues and principles of AdGuard products</a>

====================/\/\/\/\/\/\=====================
第一个docker用于国内网站去广告等等

第二个国外不要混在一起

1. 步骤1：预处理

# 创建配置文件目录， 在数据磁盘下面创建  adg 目录，例如：

========================/========================
#!/bin/sh
DISK=/home    # 根据实际情况请自行检查
mkdir  ${DISK}/AdGuardHome
mkdir  ${DISK}/AdGuardHome/work1
mkdir  ${DISK}/AdGuardHome/conf1
mkdir  ${DISK}/AdGuardHome/work2
mkdir  ${DISK}/AdGuardHome/conf2
========================/========================

2. 步骤2: 抓取最新版本 adg镜像：

========================/========================

docker pull  adguard/adguardhome:latest

========================/========================

3. 步骤3: 启动第一个容器：可以把下面的内容写到一个脚本里面方便重复使用

========================/========================
#!/bin/sh
DISK=/home    # 根据实际情况请自行检查
docker stop adg1
docker rm adg1
docker pull  adguard/adguardhome:latest   # 每隔一段时间可以重新抓一次新版镜像
docker image prune -f  # 清理旧版的镜像
docker run --name adguardhome1 \
        -v ${DISK}/AdGuardHome/work1:/opt/adguardhome/work \
        -v ${DISK}/AdGuardHome/conf1:/opt/adguardhome/conf \
        --restart=always \
        --net=host \
        -d adguard/adguardhome:latest 

========================/========================

# 容器启动后，用浏览器进入 http://ip:3000/, 完成第一个容器的配置：一般建议把 80改为3001， 53改为 5335

# 上游的dns选择国内的

# bootstrap dns也选国内的
 
4. 启动第2个容器：可以把下面的内容写到一个脚本里面方便重复使用 

========================/========================
#!/bin/sh
DISK=/home    # 根据实际情况请自行检查
docker stop adg2
docker rm adg2
docker pull  adguard/adguardhome:latest  # 每隔一段时间可以重新抓一次新版镜像
docker image prune -f  # 清理旧版的镜像
docker run --name adg2 \
        -v ${DISK}/AdGuardHome/work2:/opt/adguardhome/work \
        -v ${DISK}/AdGuardHome/conf2:/opt/adguardhome/conf \
        --restart=always \
        --net=host \
        -d adguard/adguardhome:latest 

========================/========================
     
#  容器启动后，用浏览器进入 http://ip:3000/, 完成第二个容器的配置：一般建议把 80改为3002， 53改为 5336 (ssrp用)，或 7913(passwall用) 

#  上游的dns选择国外的，并且采用 tcp、tls、https等协议，不要采用默认的udp

#   bootstrap dns选国内
