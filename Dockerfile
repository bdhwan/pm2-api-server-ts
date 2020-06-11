FROM bdhwan/parse-server:4.0
MAINTAINER bdhwan@gmail.com

RUN sudo apt-get update
RUN sudo apt-get update --fix-missing

RUN sudo apt-get install -y libfontconfig
RUN sudo apt-get install -y phantomjs
RUN sudo apt-get install -y fonts-unfonts-core
RUN sudo apt-get install -y fonts-unfonts-extra
RUN sudo apt-get install -y fonts-nanum-coding
RUN sudo apt-get install -y redis-tools

RUN sudo npm install npm@latest -g
RUN sudo npm install typescript -g
RUN sudo npm install pm2 -g


RUN sudo apt install fonts-noto-cjk
RUN sudo apt purge -y fonts-nanum* fonts-unfont*
RUN rm -rf /usr/share/fonts/truetype
RUN rm -rf /usr/share/fonts/opentype/noto/NotoSerifCJK-Bold.ttc
RUN rm -rf /usr/share/fonts/opentype/noto/NotoSerifCJK-Regular.ttc


RUN tsc --version

ADD healthcheck.js /home/healthcheck.js
ADD check.sh /home/check.sh

WORKDIR /home
HEALTHCHECK --interval=5s --timeout=3s --retries=200 CMD node healthcheck.js
EXPOSE 80
ENTRYPOINT ["/bin/sh", "check.sh"]


