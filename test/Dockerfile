FROM inspirehep/invenio-drone:latest
MAINTAINER Federico Poli "federico.poli@cern.ch"

RUN sudo apt-get install -y python-yaml

RUN mkdir -p /tmp/test
RUN chown drone:drone /tmp/test
ENV BUILD_DIR /tmp/test
WORKDIR /tmp/test

ADD drone-run.py /usr/local/bin/drone-run
RUN sudo chmod 755 /usr/local/bin/drone-run

ADD drone /usr/local/bin/
RUN sudo chmod 755 /usr/local/bin/drone

CMD /usr/local/bin/drone
