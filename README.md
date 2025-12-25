# 欢迎使用这个项目
项目是docker跑mdt

你也可以自己构建 我们提供了Dockerfile文件
在Dockerfile目录下放置server-release.jar服务端
然后执行docker build -t mindustry-server .
你即可构建成功你的镜像


# 信息
基础镜像：openjdk:17-jdk-alpine
安装的软件包：curl  bash  screen




# 端
目前只使用了原版以及WZ进行测试理论上其他的也可以


# 游戏版本会根据服务端来定
你需要将服务端放入同一个目录

#一键构建
使用start.sh脚本即可一键构建并创建容器  sh start.sh
需要使用sudo 如果您已将docker添加至用户组则不需要 但是源文件还是使用了sudo 你可以自行取消掉


# 构建镜像
docker build -t mindustry-server:latest

#创建容器
sudo docker run -d --name mindustry -p 6567:6567 docker/mindustry-server:latest

启动地图你需要进入容器终端根据提示来链接守护进程使用host来随机地图
如果你使用了WZ等等等等插件自行随机地图则可以忽略

容器默认配置是360m内存 2核 镜像空间约552.9MB

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
