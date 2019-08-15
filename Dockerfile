FROM arm32v7/node:8.16-slim

LABEL maintainer "LJason <https://ljason.cn>"

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

RUN apt -qq update && apt -qq install --no-install-recommends -y git python build-essential && \
	git clone --depth 1 https://github.com/DIYgod/RSSHub.git && \
	cd RSSHub && npm install --production && \
	apt -qq -y purge build-essential python && apt -qq -y autoremove && \
	rm -rf /var/cache/apt/*

WORKDIR /RSSHub

EXPOSE 1200

CMD git pull && npm run start
