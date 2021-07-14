# node 升级版本

node有一个模块叫n，是专门用来管理node.js的版本

'用n升级nodejs'

    # 查看版本
    node -v 
    # 先清除 npm cache
    sudo npm cache clean -force
    # 全局安装n
    sudo npm install -g n
    # 升级到最新稳定版
    sudo n stable 
    # 升级到最新版
    sudo n latest
    # 升级到定制版
    sudo n v7.19.1
    # 切换使用版本
    sudo n 7.19.1

'删除制定版本'

    sudo n rm 7.19.1

'用制定的版本执行脚本'

    n use 7.19.1 xxx.js

# npm的常用命令

    npm -v          #显示版本，检查npm 是否正确安装。
 
    npm install express   #安装express模块
 
    npm install -g express  #全局安装express模块
 
    npm list         #列出已安装模块
 
    npm show express     #显示模块详情
 
    npm update        #升级当前目录下的项目的所有模块
 
    npm update express    #升级当前目录下的项目的指定模块
 
    npm update -g express  #升级全局安装的express模块
 
    npm uninstall express  #删除指定的模块
