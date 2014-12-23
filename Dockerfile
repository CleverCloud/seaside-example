# -*- sh -*-
FROM geal/archlinux-seaside
MAINTAINER Geoffroy Couprie, contact@geoffroycouprie.com

ADD . /home/deploy

EXPOSE 8080

#CMD ./pharo Pharo.image ./deploy/zinc.st
CMD ./pharo Pharo.image ./deploy/seaside.st
