FROM bdhwan/parse-server:4.0
MAINTAINER bdhwan@gmail.com

RUN sudo apt-get update
RUN sudo apt-get update --fix-missing

RUN sudo apt-get install -y libfontconfig
RUN sudo apt-get install -y phantomjs
RUN sudo apt-get install -y fonts-unfonts-core
RUN sudo apt-get install -y fonts-unfonts-extra
RUN sudo apt-get install -y fonts-nanum-coding

RUN sudo npm install npm@latest -g
RUN sudo npm install typescript -g


RUN sudo apt purge -y fonts-nanum* fonts-unfont*
RUN cd /usr/share/fonts
RUN rm -rf truetype/
RUN sudo apt install fonts-noto-cjk

RUN tsc --version

ADD healthcheck.js /home/healthcheck.js
ADD check.sh /home/check.sh

WORKDIR /home

EXPOSE 80
ENTRYPOINT ["/bin/sh", "check.sh"]


