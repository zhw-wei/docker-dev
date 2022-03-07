#!/bin/bash

rocketmq_path="/usr/local/programs/rocketmq-4.9.2"
echo "rocketmq path is $rocketmq_path"

local_ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"|grep 192`
echo "local ip is $local_ip"

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

# 启动namesrv
nohup bash $rocketmq_path/bin/mqnamesrv &

# 启动borker
nohup bash $rocketmq_path/bin/mqbroker -c conf/broker.conf -n 127.0.0.1:9876 &

ps -ef | grep $rocketmq_path