过时了 才想起来 之前手机玩 收效甚微 也就遗忘了 

在redrain.py同目录下，建立docker-compose.yml文件，内容如下：
version: "2.0"
services:
  redrain:
    image: nevinee/redrain
    container_name: redrain
    restart: always
    tty: true
    network_mode: bridge
    hostname: redrain
    volumes:
      - ./:/redrain
首次部署容器时，需要按以下流程初始化
docker exec -it redrain pm2 stop redrain
docker exec -it redrain python redrain.py
# 按提示输入信息以后，Ctrl+C退出运行，然后以下一条命令重启容器
docker-compose restart


==================================================================/作者代码——
from datetime import datetime, timezone, timedelta
from telethon import TelegramClient, events
import requests, re, time, os

api_id = 'XXX'
api_hash = 'XXX'
tg_user_id = 'XXX'
tg_bot_token = 'XXX:XXX'
output_msg = False # 是否打印消息
channel_white_list = [1427039780] # 过滤频道消息
cookies = [
        "pt_key=XXX;pt_pin=XXX;",
        "pt_key=XXX;pt_pin=XXX;",
        ]

proxies={ #tg推送用代理，不需要的请删除51行proxies参数或者取消52行注释 注释51行
        'http':'http://127.0.0.1:7890',
        'https':'http://127.0.0.1:7890'
        }

regex = re.compile(r"(https://api.m.jd.com.*)\)", re.M)

client = TelegramClient(
        'your session id',
        api_id,
        api_hash
        )

headers = {
        "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1",
        "Cookie": "",
        }

utc_datetime = datetime.utcnow().replace(tzinfo=timezone.utc)
beijing_datetime = utc_datetime.astimezone(timezone(timedelta(hours=8)))

if beijing_datetime.minute % 10 == 0:
    f = open("push.txt","r")
    text = f.read()
    f.close()
    msg ={
        'chat_id': {tg_user_id},
        'text': f'直播间京豆\n\n{text}',
        'disable_web_page_preview': 'true'
        }
    requests.post(url=f'https://api.telegram.org/bot{tg_bot_token}/sendMessage', data=msg, timeout=15, proxies=proxies).json()
    #requests.post(url=f'https://api.telegram.org/bot{tg_bot_token}/sendMessage', data=msg, timeout=15).json()
    f = open("push.txt","w")
    f.write(" ")
    f.close()

def get_bean(url):
    for cookie in cookies:
        headers["Cookie"] = cookie
        res = requests.get(url, headers=headers).json()
        if int(res['code']) != 0:
            print("cookie无效")
        else:
            print(res['data']['awardTitle'], res['data']['couponQuota'])
        desp = ''
        desp += '{} {}\n'.format(res['data']['awardTitle'], res['data']['couponQuota'])
        if "None" in desp:
            break
        else:
            f=open(push.txt,"a")
            f.write(desp)
            f.close


@client.on(events.NewMessage)
async def my_event_handler(event):
    if event.peer_id.channel_id not in channel_white_list :
        return
    jdUrl = re.findall(regex, event.message.text)
    if output_msg:
        print(event.message.text)
    if len(jdUrl) == 1:
        get_bean(jdUrl[0])

with client:
    client.loop.run_forever()

==================================================================/

