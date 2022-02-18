#!/bin/bash

# Update from GitHub
cd /root/elk/
git pull origin main

# Update filebeat.yml in /etc/filebeat/
cp -f /root/elk/filebeat.yml /etc/filebeat/

# Restart filebeat
systemctl restart filebeat
