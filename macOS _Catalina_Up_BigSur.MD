黑果Catalina 11 To Big Sur升级小记

Big Sur的升级提示存在很久了 一直没有升级 毕竟跨版本升级 天晓得会发生什么 今天终于想升级了 其实也是苦于App Store无法正常打开

由于正整理自己的镜像 顺手点了直接升级 结果想起来的时候扭头才发现 画面依旧定格在Apple的LOGO 心里咯噔一下 完了 得重新安装了 实在舍不得 毕竟资料都在里面 但还是下载最新版Big Sur镜像 备用

先试着PE引导 修复无果（单系统） 换安装U盘 可引导进入系统 想到可能是旧版没提供新版的支持 于是下载最新版<a href="https://github.com/acidanthera/OpenCorePkg">OpenCore-0.6.8</a> 挂载引导分区 备份EFI 删除本机EFI文件夹 解压OpenCore 将备份中本机的

/EFI/OC/config.plist

ACPI/*aml

X64/EFI/OC/Kexts/

将Drivers 文件夹里没用的 efi 文件，然后把本机特有的 efi 拷贝进去，例如我机器里面的就是 HFSPlus.efi文件拷贝进去

继续之前未完成的升级(记得清空NVRAM)

漫长等待后，和数次重启终于可以正常进入系统了

备份很重要 养成好习惯
