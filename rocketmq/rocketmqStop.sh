#!/bin/bash

rocketmq_path="/usr/local/programs/rocketmq-4.9.2"
echo "rocketmq path is $rocketmq_path"

bash $rocketmq_path/bin/mqshutdown broker
echo 
bash $rocketmq_path/bin/mqshutdown namesrv

sleep 3s

echo
echo "============================================"
echo

ps -ef | grep $rocketmq_path