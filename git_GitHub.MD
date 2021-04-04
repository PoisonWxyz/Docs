git 将项目上传到GitHub 如何配置SSH Key
ssh-keygen -t rsa -C "XXXXX@gmail.com"

获取SSH Key
cat id_rsa.pub
===========================/
ssh-rsa xxxxx XXXXX@gmail.com
=============================/
验证是否成功，在git bash里输入下面的命令
ssh -T git@github.com

下面开始设置username和email，因为github每次commit都会记录他们
$ git config --global user.name  "name"//你的GitHub登陆名
$ git config --global user.email "XXXXX@gmail.com"//你的GitHub注册邮箱
接下来就是把本地仓库传到github上去，之前在GitHub上建好一个新的仓库是，跳转的页面，完全按照上面的只是操作就可以了
$ git remote add origin git@github.com:XXXXX/example.git    //关联一个远程库命令， git@github.com:XXXXX/example.git   这个是自己远程库
git push -u origin master    //关联后,第一次推送master分支的所有内容命令，此后，每次本地提交后，就可以使用命令git push origin master推送最新修改
