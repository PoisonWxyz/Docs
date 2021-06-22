# By drewnb • Updated 6 hours ago
jdc已集成青龙和花语2.0.3的所有功能，镜像源自whyour大佬 , 2.2-jdc为青龙2.2锁定版,镜像源自limoe大佬

    docker run -dit \
    -v /$pwd/ql/config:/ql/config \
    -v /$pwd/ql/log:/ql/log \
    -v /$pwd/ql/scripts:/ql/scripts \
    -v /$pwd/ql/raw:/ql/raw \
    -v /$pwd/ql/repo:/ql/repo \
    -v /$pwd/ql/jbot:/ql/jbot \
    -p 5700:5700 \
    -p 5701:5701 \
    -e ENABLE_HANGUP=false \
    -e ENABLE_WEB_PANEL=true \
    --name qinglong \
    --hostname qinglong \
    --restart always \
    drewnb/qinglong:2.2-jdc

*1、进入容器*

    docker exec -it qinglong bash # 此处为容器名

*2、进入jdc文件夹*

    cd jdc/ (2.2-jdc不用再进jdc目录，直接在/ql目录下）

*3、执行：#

    nohup ./JDC >/dev/null 2>&1 &

或

    pm2 start JDC

青龙IP 容器IP：5700

jdcIP 容器IP：5701

*多容器部署：*

-p 5700:5700 \ XXXX:5700

-p 5701:5701 \XXXX:5701

