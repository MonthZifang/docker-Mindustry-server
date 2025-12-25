#!/bin/bash
echo "开始构建镜像"
sudo docker build -t mindustry-server:latest .
echo "开始创建目录复制文件"
sudo mkdir -p /server/Mindustry
TEMP_CONTAINER="mindustry-temp"
sudo docker run -d --name $TEMP_CONTAINER mindustry-server:latest tail -f /dev/null
sudo docker cp $TEMP_CONTAINER:/server/Mindustry/server-release.jar /server/Mindustry/
sudo docker rm -f $TEMP_CONTAINER


echo "开始创建容器"
sudo docker run -d \
  --name mindustry \
  -p 6567:6567/tcp \
  -p 6567:6567/udp \
  --memory="360m" \
  --cpus="2" \
  -v /server/Mindustry:/server/Mindustry \
  mindustry-server:latest


echo ""
echo "连接信息"
IP=$(hostname -I | awk '{print $1}')
echo "服务器IP: ${IP}:6567"
echo "本地连接: localhost:6567"
echo ""
echo "启动完成!"
