#!/bin/bash

/usr/share/logstash/bin/logstash-plugin update logstash-output-s3

crontab /var/logstash/cron.txt
