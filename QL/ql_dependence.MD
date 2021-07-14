# 青龙依赖关系

## 适用于JDHelloWorld的宠汪汪二代目和宠汪汪兑奖品二代目

`cd scripts && npm i -S png-js && npm i && npm i -g ts-node typescript @types/node && npm i date-fns axios && npm i ts-md5`

## 适用于柠檬胖虎代维护lxk0301仓库，宠汪汪二代目和宠汪汪兑换

`cd /ql/scripts && apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev &&  npm install canvas --build-from-source &`


## 新版青龙已支持 task .ts

添加task运行选择node、python3还是ts-node 编辑/ql/shell/task.sh

    define_program() {
        local p1=$1
        if [[ $p1 == *.js ]]; then
            which_program="node"
        elif [[ $p1 == *.py ]]; then
            which_program="python3"
        elif [[ $p1 == *.ts ]]; then
            which_program="ts-node"
        elif [[ $p1 == *.sh ]]; then
            which_program="bash"
        else
            which_program=""
        fi
    
}

或者直接运行添加 #编辑插入15、16行 并显示

`cd /ql/shell/ && sed -i '14a \    elif [[ $p1 == *.ts ]]; then\n        which_program="ts-node"' task.sh && clear && cd /ql/ && echo task.sh 第15、16行 && sed -n '15,16p' /ql/shell/task.sh`

# 依赖
# 适用于柠檬胖虎代维护 lxk0301 仓库，宠汪汪二代目和宠汪汪兑换，只支持国内机

    apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && cd scripts && npm install canvas --build-from-source

# 依赖
## Python 3 安装 requests
pip3 install requests
## 安装 canvas，适用于柠檬胖虎代维护 lxk0301 仓库，宠汪汪二代目和宠汪汪兑换，只支持国内机
apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && cd scripts && npm install canvas --build-from-source
## 安装 png-js，适用于 JDHelloWorld 和 he1pu 的宠汪汪二代目和宠汪汪兑奖品二代目
npm install png-js -S
## 安装 date-fns
npm install date-fns -S
## 安装 axios
npm install axios -S
## 安装 crypto-js
npm install crypto-js -S
## 安装 ts-md5
npm install ts-md5 -S
## 安装 tslib
npm install tslib -S
## 安装 @types/node
npm install @types/node -S

# 快速替换

    cd /ql/config

    curl -sL https://git.io/config.sh > config.sh

    curl -sL https://git.io/extra.sh > extra.sh

    curl -sL https://git.io/code.sh > code.sh

    curl -sL https://git.io/task_before.sh > task_before.sh

