FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

ARG PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

RUN apk add -qq --no-cache --virtual .build-deps git build-base tzdata && \
	apk add -qq --no-cache npm python3 && \
	ln -s /usr/bin/python3 /usr/bin/python && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo "Asia/Shanghai" > /etc/timezone

RUN git clone --depth=1 https://github.com/DIYgod/RSSHub.git && \
	cd RSSHub && rm -rf .git && npm install --production && \
	apk del -qq --purge .build-deps

WORKDIR /RSSHub

EXPOSE 1200

CMD npm run start
