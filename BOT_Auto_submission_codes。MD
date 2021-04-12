拉取BOT

<a href="https://hub.docker.com/r/ugeek/telegram-cli" target="_blank">telegram-cli</a>

Create Docker for amd64[size:480M]

docker create \
 --name telegram-cli \
 -e TZ=Europe/Madrid \
 -v $home/home/telegram-cli:/root/.telegram-cli \
  ugeek/telegram-cli:amd64
  

启动docker
docker start telegram-cli

执行telegram-cli命令行交互（先执行一次登陆，输入telegram注册的手机号码，号码记得加区号。）
docker exec -it telegram-cli telegram-cli -N -W

 cd $home/home/telegram-cli  ### 或者你自己想要存放的目录
 git clone --recursive https://github.com/vysheng/tg.git && cd tg

如有openssl报错解决方法
apt-get install -y libgcrypt20-dev libssl-dev
./configure --disable-openssl --prefix=/usr CFLAGS="$CFLAGS -w"
make


nano bot_key.pub

telegram-cli -k bot_key.pub


telegram-cli -W -e "msg Turing_Lab_Bot /count_activity_codes"


nano submit_activity_codes.sh

===============================================================/

telegramPath=/usr/bin #记得替换你telegram-cli目录/xxx/tg/bin

(
  sleep 5
  ### @Turing_Lab_Bot
  ###京喜财富岛
  echo "msg Turing_Lab_Bot /submit_activity_codes jxcfd 互助码"
  ###京东闪购盲盒
  echo "msg Turing_Lab_Bot /submit_activity_codes sgmh 互助码"
  ###京东环球挑战赛
  echo "msg Turing_Lab_Bot /submit_activity_codes jdglobal 互助码"
  ###惊喜工厂
  echo "msg Turing_Lab_Bot /submit_activity_codes jxfactory 互助码"
  ###东东工厂
  echo "msg Turing_Lab_Bot /submit_activity_codes ddfactory 互助码"
  ###东东萌宠
  echo "msg Turing_Lab_Bot /submit_activity_codes pet 互助码"
  ##种豆得豆
  echo "msg Turing_Lab_Bot /submit_activity_codes bean 互助码"
  ###东东农场
  echo "msg Turing_Lab_Bot /submit_activity_codes farm 互助码"
  ### @Commit_Code_Bot
  ###JD签到领现金 提交助力码
  echo "msg Commit_Code_Bot /jdcash 互助码"
  ###JD签到领现金 提交助力码
  echo "msg Commit_Code_Bot /jdcrazyjoy 互助码"
  echo "safe_quit"
) | docker exec -i telegram-cli telegram-cli -N -W

-D参数关闭了输出，调试的时候可以删除该参数(虽然没什么用，因为你命令发出去还没有等回显就已经结束命令了)。

docker 用户将最后一行脚本替换成) | docker exec -i telegram-cli telegram-cli -N -W,删除telegramPath=TG Path #记得替换你telegram-cli目录/xxx/tg/bin即可

chmod +x submit_activity_codes.sh

bash submit_activity_codes.sh

添加crontab定时任务

助力池每次清空日期为每月1，8，16，24号，延迟10分钟后执行：
crontab -e
10 0 1,8,16,24 * * bash /home/telegram-cli/submit_activity_codes.sh

原文：
<a href="https://www.orzlee.com/toss/2021/02/24/lxk0301-jingdong-signin-scriptautomatic-submission-of-mutual-aid-codes.html" target="_blank">LXK0301京东签到脚本-自动提交互助码</a>
