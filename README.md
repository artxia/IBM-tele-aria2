# IBM-tele-aria2

IBM Cloud Fonudray + tele-aria2(Telegram+Aria2) + Github Actions

效果：用GitHub Actions全自动安装tele-aria2机器人(Telegram+Aria2)，并且每周五12点定时重启IBM CF

前提：已安装Aria2、并申请好Telegram机器人

第一步：注册IBM Cloud Fonudray记住账号密码
cloud.ibm.com

第二步：打开GitHub注册，然后Fork本项目（顺便点个Star）

第三步：在你自己的GitHub项目里面点Settings（设置）然后点Secrets（隐私）新建如下内容

Key | Value | Type | Required
-- | -- | -- | --
IBM_MAIL | IBM Cloud的登录邮箱 | Secrets | Yes
IBM_PWD | IBM Cloud的登录密码 | Secrets | Yes
IBM_APP_NAME | CF App的名称（自己取一个） | Secrets | Yes
IBM_RGN | CF App的区域（默认填入us-south） | Secrets | Yes
ARIA2_SERVER | Aria2服务端PRC地址 例如 ws://192.168.1.1:6800/jsonrpc | Secrets | Yes
ARIA2_KEY | Aria2服务端PRC的KEY | Secrets | Yes
BOT_TOKEN | Telegram机器人token | Secrets | Yes
TELEGRAM_ID | Telegram账号ID(约8位数ID) | Secrets | Yes

第四步：在你自己的GitHub项目里面，点Actions然后点左侧IBM Cloud Auto Install切换，然后点 Run workflow 开始全自动安装

结束

打开你自己建的TGbot，输入/start


## 核心项目 [tele-aria2](https://github.com/HouCoder/tele-aria2)
