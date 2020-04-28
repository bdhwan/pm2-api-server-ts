FROM bdhwan/parse-server:4.0
MAINTAINER bdhwan@gmail.com

RUN sudo npm install npm@latest -g
RUN sudo npm install typescript -g
RUN tsc --version

ADD healthcheck.js /home/healthcheck.js
ADD check.sh /home/check.sh

WORKDIR /home

EXPOSE 80
ENTRYPOINT ["/bin/sh", "check.sh"]


