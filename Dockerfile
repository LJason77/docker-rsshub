FROM alpine

LABEL maintainer "LJason <https://ljason.cn>"

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

RUN apk add --no-cache --virtual .build-deps git build-base tzdata && \
	apk add --no-cache npm && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo "Asia/Shanghai" > /etc/timezone && \
	git clone --depth 1 https://github.com/DIYgod/RSSHub.git && \
	cd RSSHub && npm install --production && \
	apk del -qq --purge .build-deps && \
	rm -rf /var/cache/apk/*

WORKDIR /RSSHub

EXPOSE 1200

CMD npm run start
