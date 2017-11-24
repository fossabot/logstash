#!/bin/bash

hostname=$(hostname)

/bin/cat << EOM > /etc/hosts
127.0.0.1   $hostname localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost6 localhost6.localdomain6
EOM

rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

/bin/cat << EOM > /etc/yum.repos.d/logstash.repo
[logstash-5.x]
name=Elastic repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOM


yum -y install java-1.8.0
yum -y remove java-1.7.0-openjdk

yum -y install logstash
