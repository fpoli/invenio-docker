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
RUN apt-get install -y libhdf5-dev
RUN sudo apt-get install -y apache2-mpm-worker libapache2-mod-wsgi

RUN locale-gen en_US.UTF-8

RUN mkdir -p /etc/apache2/ssl
RUN /usr/sbin/make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /etc/apache2/ssl/apache.pem
RUN /usr/sbin/a2enmod ssl

RUN pip install nose git+https://bitbucket.org/osso/invenio-devserver.git


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
RUN pip install -r /home/drone/requirements.txt
