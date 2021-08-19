# Git报错: OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443

查看自己的git代理

    git config --global --get http.proxy
    
    git config --global --get https.proxy

重置

    git config --global --unset http.proxy

    git config --global --unset https.proxy

设置自己的代理

    git config --global http.proxy '127.0.0.1:xxxx'
    
    git config --global https.proxy '127.0.0.1:xxxx'

添加远程代理

    git config --global --add remote.origin.proxy ""

