#!/bin/bash

rocketmq_path="/usr/local/programs/rocketmq-4.9.2"
echo "rocketmq path is $rocketmq_path"

bash $rocketmq_path/bin/mqshutdown broker
bash $rocketmq_path/bin/mqshutdown namesrv

ps -ef | grep $rocketmq_path