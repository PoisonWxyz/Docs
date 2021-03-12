Python 运行需要根据脚本 下载对应依赖包

需要第三方库 requests
安装 Requests

通过pip安装

pip install requests

或者，下载代码后安装：
git clone git://github.com/kennethreitz/requests.git
cd requests
python setup.py install

pip install python-utils

又或者：直播间京豆 
apt install python-pip 
安装pip

需要第三方库 requests 
安装 Requests 
通过pip安装 pip install requests 
pip3 install telethon 
pip3 install pysocks 
pip3 install httpx

pip3 install telethon pysocks httpx 或者 py -3 -m install telethon pysocks httpx


其余部分依赖安装
ModuleNotFoundError: No module named ‘yaml’

python3.X：pip install pyyaml 来安装，或者sudo pip install pyyaml
其他 pip install yaml

ImportError: No module named cv2

sudo pip3 install opencv-python
或者pip3 install opencv-python
或者pip install opencv-python

ModuleNotFoundError: No module named ‘tensorboard’

sudo pip3 install tensorboard
ModuleNotFoundError: No module named ‘apt_pkg’

1.sudo apt-get remove --purge python-apt
2. sudo apt-get install -f -y python-apt
3. cd /usr/lib/python3/dist-packages/
4. sudo cp apt_pkg.cpython-35m-x86_64-linux-gnu.so apt_pkg.cpython-36m-x86_64-linux-gnu.so

ModuleNotFoundError: No module named ‘past’

sudo pip3 install future
输入pip命令报错：from pip import main ImportError: cannot import name ‘main’
sudo vim /usr/bin/pip3（python 3.6）
修改前：
from pip import main  
if __name__ == '__main__':  
    sys.exit(main()) 
修改后：
from pip import __main__  
if __name__ == '__main__':  
    sys.exit(__main__._main())  #注意main两侧为两个“-”

from pip import main ImportError: cannot import name ‘lmdb’
sudo apt-get install python3.6 python-dev python3.6-dev
注意和自己python版本对应
sudo pip3 install lmdb

