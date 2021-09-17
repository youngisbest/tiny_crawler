# tiny_crawler
这个项目主要是为了构建一个小型的python爬虫镜像，包含基础的python爬虫指令，尽量做的小巧，且支持arm32v7、x86_64平台上使用。



## 构建步骤

1. 首先选择python的基础镜像，通过在Ubuntu x64和树莓派2B上的简单测试，选择了`python:3.8-alpine3.12`，查看一下镜像的大小：

   - Ubuntu x64上为43.5MB；
   - 树莓派2B上为36.7MB；

2. python需要修改pip镜像地址，这里先固定为阿里的pip镜像源；

   `pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/`

3. 为了减少编译后的镜像大小，如果要安装组件，不要进行update，使用`--no-cache`参数

4. 安装vritualenv进行python虚拟环境

5. 安装requests、bs4用于网络数据爬取和解析

6. BeautifulSoup解析网页使用`html.parser`，如果使用`lxml`就要安装libc等相关支持库，会增加镜像大小

> lxml依赖gcc libc-dev libxml2-dev libxslt-dev



## Dockerfile

```
FROM python:3.8-alpine3.12

RUN set -ex \
	&& pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
	&& pip install virtualenv requests bs4
```

编译后的镜像，在Ubuntu x64上为67.1MB。

