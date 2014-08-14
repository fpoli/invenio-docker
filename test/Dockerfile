FROM inspirehep/invenio-drone:latest
MAINTAINER Federico Poli "federico.poli@cern.ch"

RUN mkdir -p /tmp/test
RUN chown drone:drone /tmp/test
ENV BUILD_DIR /tmp/test
WORKDIR /tmp/test

ADD drone /usr/local/bin/
RUN sudo chmod 755 /usr/local/bin/drone

CMD /usr/local/bin/drone
