# Mindustry Docker Server

这是一个使用 Docker 运行 Mindustry Dedicated Server（mdt）的项目，适合快速部署与管理服务器环境。

你既可以直接使用已构建的镜像，也可以根据提供的 Dockerfile 自行构建。

---

## 项目说明

- 本项目通过 Docker 运行 Mindustry 服务端
- 支持原版服务端以及 WZ 端（已测试）
- 理论上兼容其他 Mindustry 服务端版本
- 游戏版本由你放入的服务端文件决定

---

## 基础信息

- 基础镜像：openjdk:17-jdk-alpine
- 预装软件包：
  - curl
  - bash
  - screen
- 默认资源配置：
  - 内存：360MB
  - CPU：2 核
  - 镜像大小：约 552.9MB

---

## 构建前准备

1. 将 `server-release.jar`（Mindustry 服务端文件）放入 Dockerfile 所在目录
2. 确保已正确安装 Docker

---

## 构建镜像

在 Dockerfile 目录下执行以下命令：

```bash
docker build -t mindustry-server:latest .
```

构建完成后即可得到本地镜像。

---

## 创建并运行容器

```bash
sudo docker run -d \
  --name mindustry \
  -p 6567:6567 \
  mindustry-server:latest
```

说明：
- 默认使用 6567 端口
- 如果你的用户已加入 docker 用户组，可以去掉 sudo
- start.sh 中默认包含 sudo，可自行修改

---

## 一键构建与运行

项目提供了 `start.sh` 脚本用于一键构建镜像并创建容器：

```bash
sh start.sh
```

注意：
- 脚本默认使用 sudo
- 如不需要 sudo，请自行编辑脚本移除

---

## 启动地图说明

- 原版服务端启动后不会自动 host 地图
- 你需要：
  - 进入容器终端
  - 按照提示连接守护进程
  - 使用 `host` 命令来随机地图
- 如果你使用的是 WZ 或其他带自动 host 功能的插件或 mod，可忽略此步骤

---

## 镜像使用方式

- 可直接导入镜像使用
- 也可通过 Dockerfile 自行构建
- 推荐自行构建以便后续自定义修改

---

## 注意事项

- 原版端默认不会自动开始游戏
- 建议配合插件或 mod 作为 host 启动
- 服务端文件必须与 Dockerfile 位于同一目录

---

## 许可证

本项目基于 GNU General Public License v3.0（GPL 3.0）发布。

- GPL 3.0 许可证全文  
  https://www.gnu.org/licenses/gpl-3.0.html

- Mindustry 服务端源代码  
  https://github.com/Anuken/Mindustry
