#!/bin/bash

echo
local_ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"|grep 192`
echo "local ip is $local_ip"
echo

container_name="rocketmq-dashboard"

# 下载容器镜像
image_num=`docker image ls | grep "apacherocketmq/rocketmq-dashboard" | wc -l`
if [ $image_num -eq 0 ]
then
    docker pull apacherocketmq/rocketmq-dashboard:latest
fi

echo
# 启动容器
container_num=`docker container ls -a | grep "apacherocketmq/rocketmq-dashboard" | wc -l`
if [ $container_num -eq 0 ]
then
    echo "启动容器 ... ..."
    docker run -d --name $container_name -e "JAVA_OPTS=-Drocketmq.namesrv.addr=$local_ip:9876" -p 8080:8080 -t apacherocketmq/rocketmq-dashboard:latest
    echo "启动容器成功 ... ..."
else
    echo "启动容器 ... ..."
    docker container start $container_name
    echo "启动容器成功 ... ..."
fi

echo
echo "rocketmq管理页面访问地址: http://$local_ip:8080"
echo
echo "停止容器命令: docker container stop $container_name"
echo