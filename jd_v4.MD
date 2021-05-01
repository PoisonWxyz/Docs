从v3升级到v4请务必不保留配置文件，只保存好必要的信息之后全新安装。

version: "2.0"
services:
  jd:
    image: nevinee/jd:v4
    container_name: jd
    restart: always
    tty: true
    network_mode: bridge
    hostname: jd
    volumes:
      - ./config:/jd/config
      - ./log:/jd/log
      - ./own:/jd/own             # own脚本目录，如需使用，建议映射
      - ./scripts:/jd/scripts    # 如果想要看到lxk0301大佬的js脚本，可以解除本行注释
    ports:
      - 5678:5678
    environment: 
      - ENABLE_TTYD=false             # 是否在启动容器时自动启动网页终端，当ENABLE_WEB_PANEL=true时此项设置才生效
      - ENABLE_WEB_PANEL=true         # 是否在启动容器时自动启动控制面板
      - ENABLE_HANGUP=true            # 是否在启动容器时自动启动挂机程序

创建好后请阅读映射的config目录下的的config.sh，并根据注释修改。控制面板初始用户名和密码：admin/adminadmin。
命令

jtask mtask otask链接的都是同一个脚本，m=my，o=own，j=jd。三者区分仅用在crontab.list中，以区别不同类型任务，手动运行直接jtask即可。

docker exec -it jd jtask   # 运行jd_scripts脚本，类似于v3版本的jd命令

docker exec -it jd otask   # 运行own脚本，详见配置文件说明

docker exec -it jd mtask   # 运行你自己的脚本

docker exec -it jd jlog    # 删除旧日志，类似于v3版本的rm_log命令

docker exec -it jd jup     # 更新所有脚本，包括jd_scripts脚本和own脚本，自动增删定时任务，类似于v3版本的git_pull命令，但更强大

docker exec -it jd jcode   # 导出所有互助码，可以准确识别没有码的ID，比v3版本的export_sharecode命令更智能

docker exec -it jd jcsv    # 记录豆豆变化情况，在log目录下存为csv文件

============================================/

限制自己使用的JD Scripts拓展机器人

/start 开始并获取指令说明
/node 获取可执行脚本的列表，选择对应的按钮执行。(拓展使用：运行指定路径脚本，例：/node /scripts/jd_818.js) 

/git 获取可执行git指令列表，选择对应的按钮执行。(拓展使用：运行指定路径脚本，例：/git -C /scripts/ pull)

/logs 获取logs下的日志文件列表，选择对应名字可以下载日志文件

/env 获取系统环境变量列表。(拓展使用：设置系统环境变量，例：/env export JD_DEBUG=true，环境变量只针对当前bot进程生效) 

/cmd 执行执行命令。参考：/cmd ls -l 涉及目录文件操作请使用绝对路径,部分shell命令开放使用

/gen_long_code 长期活动互助码提交消息生成

/gen_temp_code 短期临时活动互助码提交消息生成

/gen_daily_code 每天变化互助码活动提交消息生成

/spnode 获取可执行脚本的列表，选择对应的按钮执行。(拓展使用：运行指定路径脚本，例：/spnode /scripts/jd_818.js)

使用bot交互+spnode后 后续用户的cookie维护更新只需要更新logs/cookies.list即可

使用bot交互+spnode后 后续执行脚本命令请使用spnode否者无法使用logs/cookies.list的cookies执行脚本，定时任务也将自动替换为spnode命令执行

spnode功能概述示例

spnode conc /scripts/jd_bean_change.js 为每个cookie单独执行jd_bean_change脚本（伪并发

spnode 1 /scripts/jd_bean_change.js 为logs/cookies.list文件里面第一行cookie账户单独执行jd_bean_change脚本

spnode jd_XXXX /scripts/jd_bean_change.js 为logs/cookies.list文件里面pt_pin=jd_XXXX的cookie账户单独执行jd_bean_change脚本

spnode /scripts/jd_bean_change.js 为logs/cookies.list所有cookies账户一起执行jd_bean_change脚本

请仔细阅读并理解上面的内容，使用bot交互默认开启spnode指令功能功能。

如需____停用___请配置环境变量 -DISABLE_SPNODE=True
