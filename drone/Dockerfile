FROM ubuntu:14.10
MAINTAINER Federico Poli "federico.poli@cern.ch"

################
# Requirements #
################

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y python-dev python-pip
RUN apt-get install -y mariadb-server libmariadbclient-dev redis-server
RUN apt-get install -y libssl-dev libxml2-dev libxslt-dev git unzip wget
RUN apt-get install -y gnuplot clisp automake pstotext gettext postfix
RUN apt-get install -y libhdf5-dev poppler-utils libapache2-mod-xsendfile
RUN apt-get install -y apache2-mpm-worker libapache2-mod-wsgi

RUN locale-gen en_US.UTF-8

RUN mkdir -p /etc/apache2/ssl
RUN /usr/sbin/make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /etc/apache2/ssl/apache.pem
RUN /usr/sbin/a2dissite 000-default
RUN /usr/sbin/a2enmod ssl
RUN /usr/sbin/a2enmod xsendfile

###############
# Create user #
###############

RUN useradd --create-home --password drone drone
RUN chown drone:drone /home/drone
RUN echo "drone ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/drone
WORKDIR /home/drone
USER drone

RUN mkdir ~/.ssh

################################
# Install Invenio Requirements #
################################

#RUN pip install -q devpi-client
#RUN devpi use http://inspireprovisioning.cern.ch/root/inspire --set-cfg

ADD requirements.txt /home/drone/requirements.txt
RUN sudo pip install -r /home/drone/requirements.txt

#################
# Configuration #
#################

ADD invenio-local.conf /home/drone/invenio-local.conf
