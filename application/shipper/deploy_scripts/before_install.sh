#!/bin/bash

hostname=$(hostname)

/bin/cat << EOM > /etc/hosts
127.0.0.1   $hostname localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost6 localhost6.localdomain6
EOM

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