FROM python:3.8-alpine3.12

RUN set -ex \
	&& pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
	&& pip install virtualenv requests bs4