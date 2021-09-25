FROM python:3.8-alpine3.12

RUN set -ex \
	&& pip install virtualenv requests bs4 -i https://mirrors.aliyun.com/pypi/simple/

ENV SVR_DIR /tiny_crawler
EXPOSE 8080

WORKDIR $SVR_DIR
CMD ["python", "-m", "http.server", "8080"]