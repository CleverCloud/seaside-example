# -*- sh -*-
FROM fcat/ubuntu-universe:12.04
MAINTAINER Geoffroy Couprie, contact@geoffroycouprie.com

RUN apt-get -qy install curl unzip lib32z1 lib32ncurses5 lib32bz2-1.0
WORKDIR /home
RUN curl get.pharo.org/stable+vm | bash
RUN echo "pharo installed"

RUN ./pharo Pharo.image eval "Gofer new \
    url:'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main'; \
    package: 'ConfigurationOfSeaside3'; \
    load. \
((Smalltalk at: #ConfigurationOfSeaside3) project version: #stable) load."

ADD . /home/deploy

EXPOSE 8080

CMD ./pharo Pharo.image ./deploy/startzinc.st
#CMD bash
