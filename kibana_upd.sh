#!/bin/bash

# Update from GitHub
cd /root/elk/
git pull origin main

# Update kibana.yml in /etc/kibana/
cp -f /root/elk/kibana.yml /etc/kibana/

# Restart kibana
systemctl restart kibana
