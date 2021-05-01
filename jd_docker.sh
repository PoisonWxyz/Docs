#!/bin/sh
#
# Copyright (C) 2020 老竭力
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#
clear

echo "
ooooooooo.              o8o                                 oooooo   oooooo     oooo 
`888   `Y88.            `"'                                  `888.    `888.     .8'  
 888   .d88'  .ooooo.  oooo   .oooo.o  .ooooo.  ooo. .oo.     `888.   .8888.   .8'   
 888ooo88P'  d88' `88b `888  d88(  "8 d88' `88b `888P"Y88b     `888  .8'`888. .8'    
 888         888   888  888  `"Y88b.  888   888  888   888      `888.8'  `888.8'     
 888         888   888  888  o.  )88b 888   888  888   888       `888'    `888'      
o888o        `Y8bod8P' o888o 8""888P' `Y8bod8P' o888o o888o       `8'      `8'       
                                                                                     
                                                                                     
                                                                                     
                                                                     
                     ==== Create by 老竭力 ====                     
              本脚本将会添加作者的助力码，感谢你的支持！             
"
DOCKER_IMG_NAME="evinedeng/jd"
JD_PATH=""
SHELL_FOLDER=$(pwd)
CONTAINER_NAME=""
CONFIG_PATH=""
LOG_PATH=""
SCR_PATH=""
GIT_SOURCE="gitee"

HAS_IMAGE=false
PULL_IMAGE=true

HAS_CONTAINER=false
DEL_CONTAINER=true
INSTALL_WATCH=false

TEST_BEAN_CHAGE=false

log() {
    echo -e "\e[32m$1 \e[0m\n"
}

inp() {
    echo -e "\e[33m$1 \e[0m\n"
}

warn() {
    echo -e "\e[31m$1 \e[0m\n"
}

cancelrun() {
    if [ $# -gt 0 ]; then
        echo     "\033[31m $1 \033[0m"
    fi
    exit 1
}

docker_install() {
    echo "检查Docker......"
    if [ -x "$(command -v docker)" ]; then
       echo "检查到Docker已安装!"
    else
       if [ -r /etc/os-release ]; then
            lsb_dist="$(. /etc/os-release && echo "$ID")"
        fi
        if [ $lsb_dist == "openwrt" ]; then
            echo "openwrt 环境请自行安装docker"
            #exit 1
        else
            echo "安装docker环境..."
            curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
            echo "安装docker环境...安装完成!"
            systemctl enable docker
            systemctl start docker
        fi
    fi
}

docker_install
warn "注意如果你什么都不清楚，建议所有选项都直接回车，使用默认选择！！！"
#配置文件目录
echo -n -e "\e[33m一.请输入配置文件保存的绝对路径,直接回车为当前目录:\e[0m"
read jd_path
JD_PATH=$jd_path
if [ -z "$jd_path" ]; then
    JD_PATH=$SHELL_FOLDER
fi
CONFIG_PATH=$JD_PATH/jd/config
LOG_PATH=$JD_PATH/jd/log
SCR_PATH=$JD_PATH/jd/scripts

#选择镜像
inp "二.请选择容器中脚本更新源：\n1) gitee[默认]\n2) github"
echo -n -e "\e[33m输入您的选择->\e[0m"
read source
if [ "$source" = "2" ]; then
    GIT_SOURCE="github"
fi

#检测镜像是否存在
if [ ! -z "$(docker images -q $DOCKER_IMG_NAME:$GIT_SOURCE 2> /dev/null)" ]; then
    HAS_IMAGE=true
    inp "检测到先前已经存在的镜像，是否拉取最新的镜像：\n1) 是[默认]\n2) 不需要"
    echo -n -e "\e[33m输入您的选择->\e[0m"
    read update
    if [ "$update" = "2" ]; then
        PULL_IMAGE=false
    fi
fi

#检测容器是否存在
check_container_name() {
    if [ ! -z "$(docker ps -a | grep $CONTAINER_NAME 2> /dev/null)" ]; then
        HAS_CONTAINER=true
        inp "检测到先前已经存在的容器，是否删除先前的容器：\n1) 是[默认]\n2) 不要"
        echo -n -e "\e[33m输入您的选择->\e[0m"
        read update
        if [ "$update" = "2" ]; then
            PULL_IMAGE=false
            inp "您选择了不要删除之前的容器，需要重新输入容器名称"
            input_container_name
        fi
    fi
}

#容器名称
input_container_name() {
    echo -n -e "\e[33m三.请输入要创建的Docker容器名称[默认为：jd]->\e[0m"
    read container_name
    if [ -z "$container_name" ]; then
        CONTAINER_NAME="jd"
    else
        CONTAINER_NAME=$container_name
    fi
    check_container_name
}
input_container_name

#是否安装WatchTower
inp "5.是否安装containrrr/watchtower自动更新Docker容器：\n1) 安装\n2) 不安装[默认]"
echo -n -e "\e[33m输入您的选择->\e[0m"
read watchtower
if [ "$watchtower" = "1" ]; then
    INSTALL_WATCH=true
fi


#配置已经创建完成，开始执行

log "1.开始创建配置文件目录"
mkdir -p $CONFIG_PATH
mkdir -p $LOG_PATH
mkdir -p $SCR_PATH


if [ $HAS_IMAGE = true ] && [ $PULL_IMAGE = true ]; then
    log "2.1.开始拉取最新的镜像"
    docker pull $DOCKER_IMG_NAME:$GIT_SOURCE
fi

if [ $HAS_CONTAINER = true ] && [ $DEL_CONTAINER = true ]; then
    log "2.2.删除先前的容器"
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

log "3.开始创建容器并执行"
docker run -dit \
    -v $CONFIG_PATH:/jd/config \
    -v $LOG_PATH:/jd/log \
    -v $SCR_PATH:/jd/scripts \
    --name $CONTAINER_NAME \
    --hostname jd \
    --restart always \
    --network host \
    $DOCKER_IMG_NAME:$GIT_SOURCE

if [ $INSTALL_WATCH = true ]; then
    log "3.1.开始创建容器并执行"
    docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower
fi

log "4.下面列出所有容器"
docker ps

sleep 3

#添加脚本作者助力码
#sed -i 's/ForOtherFruit1=""/ForOtherFruit1="a846927b13a84b7ba703a9c4d580ff0b@1854ba8f9b5c4e24b9fc3d106b558162@4e57025c2fa847609c03dca04aa41ba2"/g' $CONFIG_PATH/config.sh
#sed -i 's/ForOtherBean1=""/ForOtherBean1="r2cvsciwruve3t4zq5f7fh7ml4@sukot3ijb55vjae7j6qofzedzdz54evbhf2z44i@4npkonnsy7xi3slihrppzfybnu3ufzbk5gwfmai"/g' $CONFIG_PATH/config.sh
#sed -i 's/ForOtherJdFactory1=""/ForOtherJdFactory1="T00866orEVlCCjVWnYaS5kRrbA@T02096g6BVpAqwOBdUSj3bJUCjVWnYaS5kRrbA@T0225KkcRxkZpF2BdE_znfYJfACjVWnYaS5kRrbA"/g' $CONFIG_PATH/config.sh
#sed -i 's/ForOtherJoy1=""/ForOtherJoy1="mGjQUKjeeEI=@Q1wugd4SpdA=@PkQRr1g1GTKExKt3LWPPfA==@3_j6Xa5_qVpoDLvAlD9TgKt9zd5YaBeE"/g' $CONFIG_PATH/config.sh #crazyJoy
#sed -i 's/ForOtherDreamFactory1=""/ForOtherDreamFactory1="UYIucTKwo-dUtpkUkw5pCQ==@T0_qKBVrEdUs3aPaVvAgHw==@xQov8XhleOxMd_lYPLtsNA=="/g' $CONFIG_PATH/config.sh #京喜工厂
#sed -i 's/ForOtherPet1=""/ForOtherPet1="MTAxODc2NTEzMTAwMDAwMDAxMDQzMjE4OQ==@MTE1NDQ5MzYwMDAwMDAwMzYyMDA2Nzk=@MTAxODc2NTEzMTAwMDAwMDAxMDQzMjc4MQ=="/g' $CONFIG_PATH/config.sh #东东萌宠

log "5.安装已经完成。\n现在你可以访问设备的 ip:5678 用户名：admin  密码：adminadmin  来添加cookie，和其他操作。感谢使用！"

