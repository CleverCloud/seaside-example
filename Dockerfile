# -*- sh -*-
FROM fcat/ubuntu-universe:12.04
MAINTAINER Geoffroy Couprie, contact@geoffroycouprie.com

RUN apt-get -qy install curl unzip lib32z1 lib32ncurses5 lib32bz2-1.0
WORKDIR /home
RUN curl get.pharo.org/stable+vm | bash
RUN echo "Pharo installed"

ADD ./install-seaside.st /home/install-seaside.st
RUN ./pharo Pharo.image ./install-seaside.st
ADD . /home/deploy

EXPOSE 8080

CMD ./pharo Pharo.image ./deploy/startzinc.st
#CMD bash
