#!/bin/bash
rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

/bin/cat << EOM > /etc/yum.repos.d/logstash.repo
[logstash-2.4]
name=Logstash repository for 2.4.x packages
baseurl=https://packages.elastic.co/logstash/2.4/centos
gpgcheck=1
gpgkey=https://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
EOM

yum -y install logstash

service logstash start