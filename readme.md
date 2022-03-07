## 说明
为本地开发环境定制各种快速启动脚本，方便使用各种工具

## 环境
1. fedora linux虚拟机
2. docker

## fedora
1. 使用fedora网页端控制台访问fedora linux
2. 关闭防火墙

## docker配置
```shell
# 启动docker服务
sudo service docker start
# 配置不使用sudo运行docker
sudo usermod -aG docker your_username
```