#!/bin/bash

service logstash restart

crontab /var/dbrotate/cron.txt