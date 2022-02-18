#!/bin/bash

# Update from GitHub
cd /root/elk/
git pull origin main

# Update logstash.yml in /etc/logstash
cp -f /root/elk/logstash.yml /etc/logstash/

# Restart logstash
systemctl restart logstash
