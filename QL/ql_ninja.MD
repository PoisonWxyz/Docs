# Ninja 仅支持 qinglong 2.8+

# 扫码，跳转登录添加/更新 cookie

<a href="https://github.com/PoisonWxyz/Collected/tree/MoonBegonia" target="_blank">MoonBegonia</a>

*第一部分：Docker拉取青龙映像：*

    普通：

        docker run -dit \
       -v $home/home/ql/config:/ql/config \
       -v $home/home/ql/log:/ql/log \
       -v $home/home/ql/db:/ql/db \
       -v $home/home/ql/scripts:/ql/scripts \
       -v $home/home/ql/jbot:/ql/jbot \
       -v $home/home/ql/repo:/ql/repo \
       -v $home/home/ql/raw:/ql/raw \
       -v $home/home/ql/ninja:/ql/ninja \
       -p 5710:5700 \
       -p 5711:5701 \
       -e ENABLE_HANGUP=true \
       -e ENABLE_WEB_PANEL=true \
       -e TZ=CST-8 \
       --name qinglong \
       --hostname qinglong \
       --restart always \
       whyour/qinglong:latest
# OR

    旁路由：

    docker run -dit \
       -v $home/home/ql/config:/ql/config \
       -v $home/home/ql/log:/ql/log \
       -v $home/home/ql/db:/ql/db \
       -v $home/home/ql/scripts:/ql/scripts \
       -v $home/home/ql/jbot:/ql/jbot \
       -v $home/home/ql/repo:/ql/repo \
       -v $home/home/ql/raw:/ql/raw \
       -v $home/home/ql/ninja:/ql/ninja \
       -p 5710:5700 \
       -p 5711:5701 \
       -e ENABLE_HANGUP=true \
       -e ENABLE_WEB_PANEL=true \
       -e TZ=CST-8 \
       --net host \
       --name qinglong \
       --hostname qinglong \
       --restart always \
       whyour/qinglong:latest

其中`$home/home` 为习惯 根据实际情况改变

# OR

    群晖：

    docker run -dit \
       -v /volume1/docker/qinglong/config:/ql/config \
       -v /volume1/docker/qinglong/log:/ql/log \
       -v /volume1/docker/qinglong/db:/ql/db \
       -v /volume1/docker/qinglong/scripts:/ql/scripts \
       -v /volume1/docker/qinglong/jbot:/ql/jbot \
       -v /volume1/docker/qinglong/repo:/ql/repo \
       -v /volume1/docker/qinglong/raw:/ql/raw \
       -v /volume1/docker/qinglong/ninja:/ql/ninja \
       -p 5710:5700 \
       -p 5711:5701 \
       -e ENABLE_HANGUP=true \
       -e ENABLE_WEB_PANEL=true \
       -e TZ=CST-8 \
       --name qinglong \
       --hostname qinglong \
       --restart always \
       whyour/qinglong:latest

*第二部分：ninja：*

`docker exec -it qinglong bash`

    如果之前安装过 ninja 的，先结束进程并清空文件夹。如果没有则从第开始执行：
`ps -ef|grep ninja|grep -v grep|awk '{print $1}'|xargs kill -9 && rm -rf /ql/ninja`

    拉取 ninja 仓库并安装必要的局部依赖

`git clone https://ghproxy.com/https://github.com/MoonBegonia/ninja.git /ql/ninja sed -i "s/ALLOW_NUM ||.*)/ALLOW_NUM || 20)/g" /ql/ninja/backend/user.js` 
    
    修改允许的最大 COOKIES 数量，即自定义 20 为你需要的数值

    `cd /ql/ninja/backend`

    `pnpm install`

    启动 ninja 服务

`pm2 start`

    将自动更新 ninja、启动 ninja 命令添加到青龙 configs 文件夹的 extra.sh 文件，实现开机自动更新和启动
`cd /ql/ninja/backend && git pull -f && cd /ql/ninja/backend && pm2 start && sed -i "s/ALLOW_NUM ||.*)/ALLOW_NUM || 20)/g" /ql/ninja/backend/user.js &`
    
    备注：20为允许的 CK 数量，可以自定义
