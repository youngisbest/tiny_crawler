FROM python:3.8-alpine3.12

RUN set -ex \
	&& pip install virtualenv requests bs4 -i https://mirrors.aliyun.com/pypi/simple/

VOLUME /tiny_crawler
EXPOSE 8080

CMD ["python", "-m", "http.server", "8080", "-d", "/tiny_crawler"]