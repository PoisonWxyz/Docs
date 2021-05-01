version: "2.0"
services:
  jd:
    image: nevinee/jd:v4-bot
    container_name: jdbot
    restart: always
    tty: true
    network_mode: bridge
    hostname: jdbot
    volumes:
      - ./config:/jd/config
      - ./log:/jd/log
      - ./own:/jd/own
      - ./scripts:/jd/scripts
    environment: 
      - ENABLE_HANGUP=true  # 是否启用挂机
      - ENABLE_TG_BOT=true  # 是否启用TG BOT

====================================/

使用方法：

    将bot.py、bot.json、rebot.sh放入/jd/config文件夹下
    在docker内执行apk add python3
    如需扫码获取cookie 需执行apk add zlib-dev gcc jpeg-dev python3-dev musl-dev
    由于需要安装多个依赖包，建议将清华源设置为默认源pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    执行pip3 install telethon python-socks[asyncio] pillow qrcode requests
    rebot.sh 用于杀死原bot进程，后台启动新进程，建议直接环境搭建好后直接 bash /jd/config/rebot.sh
    如果需要更换机器人token，需要将bot.session删除后，重新运行bash /jd/config/rebot.sh

主要实现功能：

    /start 开始使用本程序
    /help 查看使用帮助
    /bash 执行bash程序，如git_pull、diy及可执行自定义.sh，例如/bash /jd/config/abcd.sh
    /node 执行js脚本文件，目前仅支持/scirpts、/config目录下js，直接输入/node jd_bean_change 即可进行执行。该命令会等待脚本执行完，期间不能使用机器人，建议使用snode命令。
    /cmd 执行cmd命令,例如/cmd python3 /python/bot.py 则将执行python目录下的bot.py
    /snode 命令可以选择脚本执行，只能选择/jd/scripts目录下的脚本，选择完后直接后台运行，不影响机器人响应其他命令
    /log 选择查看执行日志
    /getfile 获取/jd目录下文件
    /getcookie 扫码获取cookie
    此外直接发送文件，会让你选择保存到哪个文件夹，如果选择运行，将保存至scripts或者own目录下，并立即运行脚本
    crontab.list文件会自动更新时间'''
