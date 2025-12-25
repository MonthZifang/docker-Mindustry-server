FROM openjdk:17-jdk-alpine

RUN apk add --no-cache curl bash screen

WORKDIR /server/Mindustry

COPY server-release.jar server-release.jar

EXPOSE 6567

# 创建screen配置文件，防止超时
RUN echo 'shell -$SHELL' > /root/.screenrc && \
    echo 'defscrollback 10000' >> /root/.screenrc && \
    echo 'termcapinfo xterm* ti@:te@' >> /root/.screenrc && \
    echo 'altscreen on' >> /root/.screenrc && \
    echo 'startup_message off' >> /root/.screenrc && \
    echo 'hardstatus alwayslastline' >> /root/.screenrc && \
    echo 'hardstatus string "%{.bW}%-w%{.rW}%n %t%{-}%+w %=%c %{..G} %H %{..Y} %d/%M %C%a"' >> /root/.screenrc

# 创建启动脚本
RUN echo '#!/bin/bash' > /start.sh && \
    echo 'if [ ! -f /server/Mindustry/server.properties ]; then' >> /start.sh && \
    echo '  echo "首次运行，等待5秒..."' >> /start.sh && \
    echo '  sleep 5' >> /start.sh && \
    echo 'fi' >> /start.sh && \
    echo 'echo "在screen会话中启动Mindustry服务器..."' >> /start.sh && \
    echo 'screen -dmS mindustry bash -c "java -jar server-release.jar; exec bash"' >> /start.sh && \
    echo 'echo "Screen会话名称: mindustry"' >> /start.sh && \
    echo 'echo "使用以下命令连接服务器控制台:"' >> /start.sh && \
    echo 'echo "  docker exec -it <容器名> screen -r mindustry"' >> /start.sh && \
    echo 'echo "退出screen会话: Ctrl+A, 然后按 D"' >> /start.sh && \
    echo 'echo "保持容器运行..."' >> /start.sh && \
    echo 'echo "每30秒发送一个空字符到screen会话，防止超时..."' >> /start.sh && \
    echo '# 防止screen超时的后台任务' >> /start.sh && \
    echo 'while true; do' >> /start.sh && \
    echo '  sleep 30' >> /start.sh && \
    echo '  if screen -list | grep -q "mindustry"; then' >> /start.sh && \
    echo '    screen -S mindustry -X stuff " "' >> /start.sh && \
    echo '  fi' >> /start.sh && \
    echo 'done &' >> /start.sh && \
    echo '# 保持容器运行' >> /start.sh && \
    echo 'tail -f /dev/null' >> /start.sh && \
    chmod +x /start.sh

CMD ["/start.sh"]
