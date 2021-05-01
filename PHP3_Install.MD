openwrt 上python pip 安装

更新源：（此为X86架构切勿盲目复制粘贴）

# USTC
src/gz openwrt_base https://mirrors.ustc.edu.cn/openwrt/releases/packages-21.02/x86_64/base

src/gz openwrt_luci https://mirrors.ustc.edu.cn/openwrt/releases/packages-21.02/x86_64/luci

src/gz openwrt_packages https://mirrors.ustc.edu.cn/openwrt/releases/packages-21.02/x86_64/packages

src/gz openwrt_routing https://mirrors.ustc.edu.cn/openwrt/releases/packages-21.02/x86_64/routing

src/gz openwrt_telephony https://mirrors.ustc.edu.cn/openwrt/releases/packages-21.02/x86_64/telephony


pip3安装和卸载以及常用命令：

python3版本：3.6.8

pip3版本：18.1

1、下载 python3.6.8 包

wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz

2、解压

tar -zxvf Python-3.6.8.tgz

3、编译

cd  Python-3.6.8

./configure

注：将python的环境编译到/usr/bin/python3的目录下，和python2一个目录下；如需编译到指定自定义目录，可添加 –prefix=/usr/local/python3指定

4、安装

make 

make install

5、创建软连接

ln -s /usr/local/python3/bin/python3 /usr/bin/python3

6、测试

python3 -V

pip3 -V

备注

1：python3安装完以后，pip3默认安装；如需单独安装pip3，见pip3安装和卸载以及常用命令

2：依照上面的方法安装完python3以后，系统中python3和python2是并行存在的，执行python时，默认还是python2，想要使用python3，要用python3



如果我们的python脚本是用python3写的，那么脚本中指定执行环境即可，如hello_world.py

# 指定用什么解释器运行脚本以及解释器所在的位置还有文件编码

#!/bin/python3

# -*- coding: UTF-8 -*-


print("hello world")


如果还不行，则执行脚本时，可直接声明是用python3，如

python3  hello_world.py

1、pip3安装

方法一：先安装python3，python3安装好后，pip3默认安装

方法二：手动下载安装指定版本

# 下载指定版本

wget https://pypi.python.org/packages/source/p/pip/pip-18.1.tar.gz

# 解压

tar -zxvf pip-18.1.tar.gz 

# 安装

cd pip-18.1

python3 setup.py build

python3 setup.py install

# 添加到软连接

ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

# 查看软连接

ll  /usr/bin/pip*


2、pip3卸载

卸载PIP

python3 -m pip uninstall pip


注：如果安装了多个版本的pip，可执行多次卸载

重装PIP的命令：easy_inatall pip

升级PIP

# 已验证

pip3 install --upgrade pip

# 未验证

python -m pip install --upgrade pip

注：默认是升级到最新版本

pip版本降级

python -m pip install pip==9.0.3

重装PIP的命令

easy_inatall pip

注：未验证

3、pip3常用命令

安装包

pip3 install sasl thrift_sasl thrift pyhive pandas pymysql

查看已安装包

pip3  list

查看已安装包信息、安装位置

pip3 show pyhive

卸载包

pip3 uninstall pyhive

4、安装包异常解决

4.1 安装sasl包失败

在集群环境中其中某台机器上安装sasl包时，一直失败，但是同样的方法别的机器都可以，网上的方法要么不靠谱，要么太麻烦，其实既然别的机器安装好了，环境又都是一样的，那直接把别的机器上安装好的包移动复制过来就行了


cd /usr/local/python3/lib/python3.6/site-packages

# 先压缩成tar文件

tar -zcvf  sasl-0.2.1-py3.6.egg-info.tar.gz   ./sasl-0.2.1-py3.6.egg-info/

# 下载到本地

sz 

# 上传到另一台及其

rz 

4.2 ModuleNotFoundError: No module named '_bz2'

pandas安装成功，但是import pandas时，报错，如下

这个问题，集群中只有两个节点遇到了，通过百度可知，是少了_bz2.cpython-36m-x86_64-linux-gnu.so这个os文件，那么解决办法和上面一样从其他机器上把这个文件复制过来即可。

# 先在正常的机器上查询到所在位置

find / -name  _bz2.cpython-36m-x86_64-linux-gnu.so

# 进入目录

 cd /usr/local/python3/lib/python3.6/lib-dynload/
 
# 下载

 sz _bz2.cpython-36m-x86_64-linux-gnu.so
 
# 有问题的机器

 # 进入目录
 
cd /usr/local/python3/lib/python3.6/lib-dynload/

# 上传

 rz
 
# 修改权限

chmod a+x   ./_bz2.cpython-36m-x86_64-linux-gnu.so

