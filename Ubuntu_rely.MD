薅羊毛依赖

docker-compose 安装（群晖nas docker自带安装了docker-compose）

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

Ubuntu用户快速安装docker-compose

sudo apt-get update && sudo apt-get install -y python3-pip curl vim git moreutils

pip3 install --upgrade pip

pip install docker-compose

安装 第三方依赖库Requests

pip install requests

或者，下载代码后安装：
git clone git://github.com/kennethreitz/requests.git

通过docker-compose version查看docker-compose版本，确认是否安装成功

安装 yarn

sudo apt install yarn

安装 npm

sudo apt install npm

安装 node

nodejs 的每个大版本号都有相对应的源，比如这里的 10.x.x版本的源是https://deb.nodesource.com/setup_10.x。

所以在终端执行： 

再执行：

sudo apt-get install -y nodejs

如果你要安装12.x.x 的版本，只需要修改添加源地址中的数字即可，比如：

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

最后验证一下，执行：nodejs -v 即可出现刚才安装的版本号

