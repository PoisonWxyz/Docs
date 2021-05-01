#添加docker用户组

    sudo groupadd docker

#将登陆用户加入到docker用户组中

    sudo gpasswd -a doud docker

#更新用户组

    newgrp docker

#测试docker命令是否可以使用sudo正常使用

    docker ps

如果依旧报错 则：
    sudo chmod 666 /var/run/docker.sock
