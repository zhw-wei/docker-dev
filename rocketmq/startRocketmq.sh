#!/bin/bash

echo

rocketmq_path="/usr/local/programs/rocketmq-4.9.2"
echo "rocketmq path is $rocketmq_path"

#***************
#
# rocketmq默认使用的java版本是java8，如果要使用的java版本是java11，需要进行如下操作
# 1. 下载java8运行环境，并配置环境变量$JAVA_HOME_8=/path/to/java8
# 2. 修改rocketmq的配置文件：runserver.sh、runbroker.sh、tools.sh，修改运行所需要的配置，如内存大小等
# 3. 修改2中的配置文件，将JAVA_HOME替换成JAVA_HOME_8: %s/JAVA_HOME/JAVA_HOME_8/g
#
# 注意：默认java8时，步骤2也是一定要改动的，因为rocketmq的配置需求要求太高
#
#***************
echo

# 启动namesrv
nohup bash $rocketmq_path/bin/mqnamesrv &
<<<<<<< HEAD
echo
=======
sleep 1s
echo 
>>>>>>> 0d64e37954f18cac4c46f313429d81bd8037cd78
# 启动borker
nohup bash $rocketmq_path/bin/mqbroker -c $rocketmq_path/conf/broker.conf -n 127.0.0.1:9876 &

sleep 3s

echo
echo "============================================"
echo

ps -ef | grep $rocketmq_path --color=auto
