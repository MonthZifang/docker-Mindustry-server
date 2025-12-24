# 欢迎使用这个项目
项目是docker跑mdt

你也可以自己构建 我们提供了Dockerfile文件
在Dockerfile目录下放置server-release.jar服务端
然后执行docker build -t mindustry-server .
你即可构建成功你的镜像


# 信息
项目使用了
Java17
docker
mindustry-server



# 插件端目前来讲没测试过
所以你如果想跑插件端的话可以自己尝试如果我后续有时间也会自己再尝试一下


# 游戏版本会根据服务端来定
你需要将服务端放入同一个目录

# 构建镜像
使用
sudo docker run -d --name mindustry -p 6567:6567 docker/mindustry-server:latest

启动地图你需要进入容器终端里面使用host来随机地图


镜像导入即可或者自己构建

# 注意

启动后原版端不会自动host
也就是说你需要插件或者mod来辅助作为host的启动

## 许可证

本项目基于 **GNU General Public License v3.0**（GPL 3.0）许可证发布。

- 您可以自由使用、复制、修改和分发本软件。
- 如果您修改了本软件并分发，您必须在您的代码中附带 GPL 3.0 许可证副本，并公开修改后的源代码。
- 您不能在没有附带源代码和许可证的情况下，分发编译后的二进制文件。

**许可证副本：**

您可以在 [GPL 3.0 许可证全文](https://www.gnu.org/licenses/gpl-3.0.html) 阅读详细内容。

服务端源代码可以从 [仓库链接](https://github.com/Anuken/Mindustry) 获取。
#
