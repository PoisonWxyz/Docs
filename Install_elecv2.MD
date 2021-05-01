
安装elecv2p
docker run -it \
#--network=host \ /'非旁路由请去掉此行注释'/
--restart=always -d \
--name elecv2p \
-e TZ=Asia/Shanghai \
-p 80:8000 \
-p 8001:8101 \
-p 8002:8102 \
-v /home/elecv2p/JSFile:/usr/local/app/script/JSFile \
-v /home/elecv2p/Store:/usr/local/app/script/Store \
-v /home/elecv2p/rootCA:/usr/local/app/rootCA \
-v /home/elecv2p/Lists:/usr/local/app/script/Lists \
-v /home/elecv2p/Shell:/usr/local/app/script/Shell \
-v /home/elecv2p/efss:/opt/elecV2P/efss elecv2/elecv2p

非旁路由请用#注释掉此行--network=host \
=====================================================================/

或者将以下内容手动保存为 docker-compose.yaml 文件。

version: '3.7'
services:
  elecv2p:
    image: elecv2/elecv2p
    container_name: elecv2p
    restart: always
    environment:
      - TZ=Asia/Shanghai
    ports:
      - "8100:80"
      - "8101:8001"
      - "8102:8002"
    volumes:
      - "/elecv2p/JSFile:/usr/local/app/script/JSFile"
      - "/elecv2p/Lists:/usr/local/app/script/Lists"
      - "/elecv2p/Store:/usr/local/app/script/Store"
      - "/elecv2p/Shell:/usr/local/app/script/Shell"
      - "/elecv2p/rootCA:/usr/local/app/rootCA"
      - "/elecv2p/efss:/usr/local/app/efss"


# 直接启动。（首次启动命令）
docker-compose up -d

# 更新镜像并重新启动。 （docker-compose 已使用 volumes 映射存储了个人数据，无需再手动备份）
docker-compose pull elecv2p && docker-compose up -d

其他 docker 相关指令

# 查看是否启动及对应端口
docker ps

# 查看运行日志
docker logs elecv2p -f

