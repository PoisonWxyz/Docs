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

其中`5710:5700` `5711:5701`为习惯 根据实际情况改变

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
# OR

docker-compose:

    version: "3"
services:
  qinglong:
    image: whyour/qinglong:latest
    container_name: qinglong
    restart: unless-stopped
    tty: true
    ports:
      - 5710:5700
      - 5711:5701
    environment:
      - ENABLE_HANGUP=true
      - ENABLE_WEB_PANEL=true
    volumes:
      - ./config:/ql/config
      - ./log:/ql/log
      - ./db:/ql/db
      - ./repo:/ql/repo
      - ./raw:/ql/raw
      - ./scripts:/ql/scripts
      - ./jbot:/ql/jbot
      - ./ninja:/ql/ninja


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
# OR ⬇⬇⬇⬇⬇

*进容器内执行以下命令:*

    git clone https://github.com/MoonBegonia/ninja.git /ql/ninja
    cd /ql/ninja/backend
    pnpm install
    pm2 start
    cp sendNotify.js /ql/scripts/sendNotify.js

*将以下内容粘贴到 extra.sh（重启后自动更新并启动 Ninja）:*

    cd /ql/ninja/backend
    git checkout .
    git pull
    pnpm install
    pm2 start
    cp sendNotify.js /ql/scripts/sendNotify.js

*目前支持的环境变量有：*

    ALLOW_ADD: 是否允许添加账号 不允许添加时则只允许已有账号登录（默认 true）
    ALLOW_NUM: 允许添加账号的最大数量（默认 40）
    PORT: Ninja 运行端口（默认 5701）
    NOTIFY: 是否开启通知功能（默认 true）
    UA: 自定义 UA，默认为随机

配置方式：

    cd /ql/ninja/backend
    cp .env.example .env
    vi .env
    pm2 start

修改完成后需要 pm2 start 重启生效

*sendNotify 环境变量*

此环境变量在青龙中配置:

    NOTIFY_SKIP_LIST: 通知黑名单，使用 & 分隔，例如 东东乐园&东东萌宠;

*注意事项:*

    重启后务必执行一次 `ql extra` 保证 Ninja 配置成功。

    更新 Ninja 只需要在容器中 ninja/backend 目录执行 `git pull` 然后 `pm2 start`

    Qinglong 需要在登录状态（auth.json 中有 token）
