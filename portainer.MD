Portainer介绍

Portainer是Docker的图形化管理工具，提供状态显示面板、应用模板快速部署、容器镜像网络数据卷的基本操作（包括上传下载镜像，创建容器等操作）、事件日志显示、容器控制台操作、Swarm集群和服务等集中管理和操作、登录用户管理和控制等功能。功能十分全面，基本能满足中小型单位对容器管理的全部需求

安装portainer

docker run -d -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /mnt/docker/portainer:/data portainer/portainer

用宿主机9000端口关联容器中的9000端口，并给容器起名为portainer。执行完该命令之后，使用该机器IP:PORT即可访问Portainer
访问方式：http://IP:9000
首次登陆需要注册用户，给admin用户设置密码：
![图片](https://user-images.githubusercontent.com/75330257/112631509-f05ce300-8e71-11eb-9eaa-1b8e11e4a322.png)

单机版这里选择local即可，选择完毕，点击Connect即可连接到本地docker：
![图片](https://user-images.githubusercontent.com/75330257/112631576-079bd080-8e72-11eb-9256-c9188c1610f9.png)
进入主页：
![图片](https://user-images.githubusercontent.com/75330257/112631645-1a160a00-8e72-11eb-98dd-6139d0b9de5e.png)
OK，portainer即安装运行成功
