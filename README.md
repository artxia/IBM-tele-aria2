# IBM-tele-aria2

IBM Cloud Fonudray + tele-aria2(Telegram+aria2) + Github Actions

效果：在GitHub点Star自动安装tele-aria2机器人，并且定时重启IBM CF

前提：已安装Aria2、并申请好Telegram机器人

第一步：注册IBM Cloud Fonudray记住账号密码
cloud.ibm.com

第二步：打开GitHub注册，然后Fork本项目

第三步：在你自己的GitHub项目里面点Settings（设置）然后点Secrets（隐私）新建如下内容

 ```
IBM_MAIL           IBM Cloud的登录邮箱
IBM_PWD            IBM Cloud的登录密码
IBM_APP_NAME       CF App的名称（自己取一个）
IBM_RGN            CF App的区域（默认填入us-south）
ARIA2_SERVER       Aria2服务端PRC地址 例如 ws://192.168.1.1:6800/jsonrpc
ARIA2_KEY          Aria2服务端PRC的KEY
BOT_TOKEN          Telegram机器人token
TELEGRAM_ID        Telegram账号ID(约8位数ID)
 ```

第四步：在你自己的GitHub项目里面，点右上角Star开始安装

结束