Git 常用的是以下 6 个命令：git clone、git push、git add 、git commit、git checkout、git pull
	workspace：工作区
	staging area：
	暂存区/缓存区
	local repository：版本库或本地仓库
	remote repository：远程仓库

	创建仓库命令
	git init	初始化仓库
	git clone 拷贝一份远程仓库，也就是下载一个项目
	
	提交与修改
	Git 的工作就是创建和保存你的项目的快照及与之后的快照进行对比
	git add 添加文件到仓库 git add . 添加所有要文件
            git staus 仓库仓库当前状态 显示所有文件
	git diff 比较文件不同 即暂存区与工作区差异
	git commit 提交暂存区到本地仓库 git commit -m ‘提交说明’
	git reset 回退版本
	git rm 删除工作区文件
	git mv 移动或重命名工作区文件
	git log 查看历史提交记录
	git blame <file> 以列表形式查看指定的文件历史修改记录
	git remote 远程查看操作 git remote add origin 仓库地址（没有添加ssh key建议使用 https地址）
	git fetch 从远程仓库获取代码
	git pull 下载远程代码并合并
	git push 上传远程代码并合并
	git push origin master 
	第一次push如果报错
	! [rejected]        master -> master (non-fast-forward)
	error:
	解决办法：
	首先 git pull origin master --allow-unrelated-histories
	如出现出现vim编辑不用管直接保存退出就行,然后建议做完上一步之后再重新：
	git add.
	git commit -m ‘提交说明’
	git push origin master
	Git 分支管理
	 git branch (branchname) 创建分支
	 git checkout (branchname) 切换分支
	 git merge 合并分支
 	更改git默认目录
	 rm -rf .git 删除默认目录
	 cd $home && git init 进入代码文件夹 初始化git	 
  