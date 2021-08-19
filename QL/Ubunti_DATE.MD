# Ubuntu修改时区和更新时间

`date -R`

如果显示的并非`+0800`东八区则需要修改

`tzselect`

依次选择`4`Asia `9` China `1` Beijing `1` Yes

`cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime`

`date -R`

再次查看时间 已经修改为北京时间
