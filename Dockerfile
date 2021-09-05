FROM python:3.9-alpine

RUN set -ex \
	&& python --version \
	&& pip --version \
	&& pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
	&& apk update \
	&& apk add gcc libc-dev libxml2-dev libxslt-dev \
	&& pip install virtualenv requests bs4 lxml