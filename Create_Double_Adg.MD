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



