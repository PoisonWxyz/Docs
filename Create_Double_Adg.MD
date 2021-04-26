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



}docker run -d --name adg2 \
    -v /home/AdGuardHome/work2:/opt/adguardhome/work \
    -v /home/AdGuardHome/conf2:/opt/adguardhome/conf \
    --net=host \
    --restart=always \
    adguard/adguardhome:latest{
    
 
 
