# 生成

    ssh-keygen -t rsa -C "XXXXX@XXXXX.com"

# 获取&部署密钥

    在~/.ssh目录下有id_rsa/id_rsa_new（私钥）和 id_rsa.pub/id_rsa_new.pub（公钥）两个文件，其中.pub文件里存放的即是公钥key，登录到GitHub，选择settings ，选择Add SSH key，把.pub的内容复制到里面即可

# 测试

    ssh -T git@github.com

    Hi xxx You've successfully authenticated, but GitHub does not provide shell access.

如果有以上提示，说明公钥添加成功

# 编辑私钥

    cd ~/.ssh && nano id_rsa

    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCys2794DCQGnVBCeMo9ED8BRw/T0kT9jsGA9crz+Lt0MMlV5fDN18pKEzkOvQY1EC68tN3sU8U+lAXOgCfuuiQJWEhoDiR5r8THrUxeIlONF7UNPYJ6v4+aagUqHNyJeDTEkS0TzkBHI8u3nHSZwPbpGaT7FuwccJ5QFpdlnAojrKLMqN9h7ZU


# 复制私钥

    docker cp ~/.ssh/id_rsa jdbot:/root/.ssh

# 进入容器

    docker exec -it jd bash

# 编辑配置



# 赋予权限

    chmod 600 ~/.ssh/id_rsa

# 进入脚本目录

    cd /jd/scripts
# 设置url

    git remote set-url origin “git@github.com:PoisonWxyz/jd_scripts.git”

# 退出容器

    exit

# 拉取

    docker exec -it jdbot bash git_pull


# 


