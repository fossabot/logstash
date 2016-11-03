#!/bin/bash

service logstash restart

crontab /var/logstash/cron.txt