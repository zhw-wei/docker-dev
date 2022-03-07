#!/bin/bash

canal_path="/usr/local/programs/canal.deployer-1.1.4"

nohup bash $canal_path/bin/startup.sh &

echo "启动完成 ..."