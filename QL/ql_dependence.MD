# 青龙依赖关系 From: Andy Woo TG Group:https://t.me/update_help_group

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
## Python 3 安装 requests
pip3 install requests
# 快速替换

    cd /ql/config

    curl -sL https://git.io/config.sh > config.sh

    curl -sL https://git.io/extra.sh > extra.sh

    curl -sL https://git.io/code.sh > code.sh

    curl -sL https://git.io/task_before.sh > task_before.sh

# /ql/config/extra.sh 的依赖安装替换如下：

    # 依赖
    install_dependencies(){
    ## Python 3 安装 requests
    pip3 install requests
    ## 安装 canvas，适用于柠檬胖虎代维护 lxk0301 仓库，宠汪汪二代目和宠汪汪兑换，只支持国内机
    apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && cd scripts && npm install canvas --build-from-source
    ## 安装 png-js，适用于 JDHelloWorld 和 he1pu 的宠汪汪二代目和宠汪汪兑奖品二代目
    npm install png-js -S
    ## 安装 date-fns axios crypto-js ts-md5 tslib @types/node ,用于解决新版惊喜财富岛依赖问题
    npm i -S date-fns axios crypto-js ts-md5 tslib @types/node dotenv
    }
    install_dependencies &

# 依赖
    package_name="canvas png-js date-fns axios crypto-js ts-md5 tslib @types/node dotenv"

    install_dependencies_normal(){
        for i in $@; do
            case $i in
                canvas)
                    if [[ "$(npm ls $i)" =~ (empty) ]]; then
                        apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && npm install $i --build-from-source
                    fi
                    ;;
                *)
                    if [[ "$(npm ls $i -g)" =~ (empty) ]]; then
                        if [[ "$(npm ls $i)" =~ $i ]]; then
                            npm uninstall $i
                        fi
                        npm i $i -g
                    fi
                    ;;
            esac
        done
    }

    install_dependencies_force(){
        for i in $@; do
            if [[ "$(npm ls $i)" =~ $i ]]; then
                npm uninstall $i
                rm -rf /ql/scripts/node_modules/$i
                rm -rf /ql/scripts/node_modules/lodash
            elif [[ "$(npm ls $i -g)" =~ $i ]]; then
                npm uninstall -g $i
                rm -rf /usr/local/lib/node_modules/$i
                rm -rf /usr/local/lib/node_modules/lodash
        fi
            case $i in
                canvas)
                    if [[ "$(npm ls $i)" =~ (empty) ]]; then
                        apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && npm install $i --build-from-source
                    fi
                    ;;
                *)
                    if [[ "$(npm ls $i -g)" =~ (empty) ]]; then
                        if [[ "$(npm ls $i)" =~ $i ]]; then
                            npm uninstall $i
                        fi
                        npm i $i -g
                    fi
                    ;;
            esac
        done
    }

    install_dependencies_all(){
        install_dependencies_normal $package_name
        for i in $package_name; do
            if [[ "$(npm ls $i -g)" =~ (empty) ]] && [[ "$(npm ls $i)" =~ (empty) ]]; then
            install_dependencies_force $i
            fi
        done
    }

    install_dependencies_all &


以上代码复制到 /ql/config/extra.sh 。如果有其他安装依赖的代码，全部替换成以上内容。
1、解决 JDHelloWorld 的 ts 脚本依赖问题；
2、解决宠汪汪的依赖问题；
3、解决京东图形验证签到的依赖问题；
4、检测依赖包的安装状态判断是否安装依赖。安全可靠，也避免重复安装依赖导致报错。`

