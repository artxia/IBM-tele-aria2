#!/bin/bash
echo
echo "============== <<部署之前先满足以下条件>> =============="
echo "1.你的应用名称"
echo "2.你的应用内存大小"
echo "3.telegram机器人token"
echo "4.telegram账号ID"
echo "5.aria2服务端地址 例如 ws://192.168.1.1:6800/jsonrpc （建议用WebSocket，没有可换为http）"
echo "6.aria2服务端key"
echo "------------------------------------------------"
read -s -n1 -p "已做好准备请按任意键开始"
echo
echo "------------------------------------------------"

SH_PATH=$(cd "$(dirname "$0")";pwd)
cd ${SH_PATH}

create_mainfest_file(){
    echo "进行配置。。。"
    read -p "请输入你的应用名称：" IBM_APP_NAME
    echo "应用名称：${IBM_APP_NAME}"
    read -p "请输入你的应用内存大小(默认256)：" IBM_MEM_SIZE
    if [ -z "${IBM_MEM_SIZE}" ];then
    IBM_MEM_SIZE=256
    fi
    echo "内存大小：${IBM_MEM_SIZE}"

    read -p "请输入机器人token：" BOT_TOKEN
    while [[ "${#BOT_TOKEN}" != 46 ]]; do
    echo "机器人TOKEN输入不正确，请重新输入"
    read -p """请输入机器人token：" BOT_TOKEN
    done
    echo "你的机器人token${BOT_TOKEN}"

    read -p "请输入使用机器人的telegram账号ID：" TELEGRAM_ID
    until [[ ${TELEGRAM_ID} =~ ^-?[0-9]+$ ]]; do
    echo -e "机器人ID输入不正确，请重新输入"
    read -p "请输入使用机器人的telegram账号ID：" TELEGRAM_ID
    done
    echo "你的telegram账号ID${TELEGRAM_ID}"

    read -p "请输入aria2服务端地址：" ARIA2_SERVER
    echo "你的aria2服务端地址${ARIA2_SERVER}"

    read -p "请输入aria2服务端key：" ARIA2_KEY
    echo "你的aria2服务端key${ARIA2_KEY}"    

    cd ~ &&
    cat >  ${SH_PATH}/manifest.yml  << EOF
    {
    applications:
    - name: ${IBM_APP_NAME}
      memory: ${IBM_MEM_SIZE}M
      docker:
        image: houcoder/tele-aria2:latest
      env:
        --aria2-server: ${ARIA2_SERVER}
        --aria2-key: ${ARIA2_KEY}
        --bot-key: ${BOT_TOKEN}
        --user-id: ${TELEGRAM_ID}
        --max-index: 10
      random-route:: true
    }
EOF
    echo "配置完成。"
}


install(){
    echo "进行安装。。。"
    ibmcloud target --cf
    ibmcloud cf push
    echo "安装完成。"
    sleep 3s
    echo
}


create_mainfest_file
install
exit 0