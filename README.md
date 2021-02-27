# RSSHub 容器 #

适合树莓派使用的 [RSSHub](https://github.com/DIYgod/RSSHub "万物皆可 RSS") 容器。

## 安装 ##

### 方法一(推荐) ###

自行编译。

```bash
git clone https://github.com/LJason77/docker-rsshub.git
cd docker-rsshub
docker build -t rsshub .
```

### 方法二(arm64) ###

```bash
docker pull ljason/rsshub:latest
```

## 运行 ##

默认端口为 1200，如需更改端口，比如 3000，请把下面命令中的 `--network host` 改为 -p 3000:1200，即为 3000 端口，以此类推。

```bash
# 方法一安装
docker run -d --restart always --name rsshub --network host rsshub
# 方法二安装
docker run -d --restart always --name rsshub --network host ljason/rsshub
```

更多配置和参数可查看 [RSSHub](https://github.com/DIYgod/RSSHub "万物皆可 RSS") 的官方文档：[部署 RSSHub](https://docs.rsshub.app/install/#配置)。