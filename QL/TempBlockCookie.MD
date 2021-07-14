# 禁用脚本的

# 写入到 config.sh

# 某个ck 不玩某个脚本

getTempBlockCookie(){
  local TempBlockCookie
  local blockCookieList
  case $1 in
    # 不玩健康社区
    *health*)
      blockCookieList="env备注1,env备注2"
      ;;
  esac
  TempBlockCookie=($(sed -r 's/\s/_/g' <<<${blockCookieList} | sed -r 's/,/\n/g'))
  #echo "当前脚本 $1, 屏蔽CK账号是：${TempBlockCookie[@]}" >> /ql/log/block.log
  [[ ${#TempBlockCookie[@]} -ne 0 ]] && echo "${TempBlockCookie[@]}"
}

# 写入到task_before.sh
# 临时屏蔽某个 ck，使用青龙 api 获取备注信息确定ck，禁用不怕混乱
blockCookie(){
    findBlockCookieArrayPos(){
        local name=$1
        for (( i = 0; i < ${#envCookieRemarks[@]}; i++ )); do
            if [[ ${envCookieRemarks[$i]} == $name ]]; then
                echo $i
                break
            fi
        done
    }

    local envJdCookie=$JD_COOKIE
    local jdCookie
    local blockCookieArrayPos
    local blockCookieValue
    local TempBlockCookie
    getEnvCookie
    TempBlockCookie=($(getTempBlockCookie $p1 ))
    [[ ${#TempBlockCookie[@]} -eq 0 ]] && return;
    for value in ${TempBlockCookie[@]}; do
        blockCookieArrayPos=$(findBlockCookieArrayPos $value)
        blockCookieValue=${envCookie[$blockCookieArrayPos]}
        if [[ -z $jdCookie ]]; then
            jdCookie=$(sed -r "s/$blockCookieValue[\&]?//" <<<$envJdCookie)
        else
            jdCookie=$(sed -r "s/$blockCookieValue[\&]?//" <<<$jdCookie)
        fi
    done
    jdCookie=$(sed -r 's/\&$//g' <<<$jdCookie)
    [[ ! -z $jdCookie ]] && export JD_COOKIE=$jdCookie
}
## 临时屏蔽脚本 结束 ###