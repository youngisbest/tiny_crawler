# tiny_crawler
这个项目主要是为了构建一个小型的python爬虫镜像，包含最基础的python爬虫指令，尽量保持精简，同时保持一定的可扩展性和自动化，支持arm32v7（树莓派）、x86_64（云服务器）平台上使用。



## 特别声明

此项目是一个测试性项目，由`http.server`构建的web服务无法保证安全性，请勿暴漏在公网环境使用。使用此项目带来的任何损失，需要自行承担。



## 构建思路

1. 首先选择python的基础镜像，通过在Ubuntu x64和树莓派2B上的简单测试，选择了`python:3.8-alpine3.12`，查看一下镜像的大小：

   - Ubuntu x64上为43.5MB；
   - 树莓派2B上为36.7MB；

2. python需要修改pip镜像地址，这里先固定为阿里的pip镜像源，后期移入配置项中；

   `pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/`

3. 为了减少编译后的镜像大小，安装组件，不先进行update，通过`--no-cache`参数来直接下载安装；

4. 安装vritualenv进行python虚拟环境

5. 安装requests、bs4用于网络数据爬取和解析

6. BeautifulSoup解析网页使用`html.parser`，如果使用`lxml`就要安装libc等相关支持库，会增加镜像大小，所以基础镜像BeautifulSoup不支持非`html.parser`之外的方式。

> lxml依赖gcc libc-dev libxml2-dev libxslt-dev

7. 通过`http.server`模块构建web服务；



## 使用

镜像可以从docker hub上获取

`docker pull youngbest/tiny_crawler:latest`



## Roadmap

- [x] 编译armv7、amd64(x86_64)的镜像，上传github；
- [x] 容器运行后，自动启动`http.server`模块，提供web服务；
- [ ] 主页展示基本信息，包括系统版本、python版本、pip版本、python组件包版本等；
- [ ] 加载手动放入的脚本，在页面中执行；
- [ ] 支持上传脚本；
- [ ] 支持新增python组件包（不依赖系统组件）；
- [ ] 支持新增系统组件；
- [ ] 支持定时任务；



