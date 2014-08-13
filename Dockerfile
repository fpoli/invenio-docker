FROM ubuntu:14.10
MAINTAINER Federico Poli "federico.poli@cern.ch"


################
# Requirements #
################

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y python-dev python-pip
RUN apt-get install -y mariadb-server libmariadbclient-dev redis-server
RUN apt-get install -y libssl-dev libxml2-dev libxslt-dev
RUN apt-get install -y gnuplot clisp automake pstotext gettext
RUN apt-get install -y postfix
RUN apt-get install -y git unzip wget
RUn apt-get install -y libhdf5-dev
RUN pip install nose git+https://bitbucket.org/osso/invenio-devserver.git

RUN locale-gen en_US.UTF-8

RUN pip install vex

RUN useradd --create-home --password drone drone
RUN echo "drone ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/drone
USER drone

################################
# Install Invenio Requirements #
################################

#RUN pip install -q devpi-client
#RUN devpi use http://inspireprovisioning.cern.ch/root/inspire --set-cfg

COPY requirements.txt /home/drone/requirements.txt
RUN vex --make invenio pip install -r /home/drone/requirements.txt
