#!/bin/bash

# Run as root?
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
else

# Install java
#yum -y install java-openjdk-devel java-openjdk

# Copy file elasticsearch.repo to /etc/yum.repos.d/
cp -f /root/elk/elasticsearch.repo /etc/yum.repos.d/

# Import key of elasticsearch repo
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

# Delete all downloads packets rpm
#yum -y clean all

# Make cache
#yum -y makecache

# Install filebeat
yum -y install filebeat auditbeat metricbeat packetbeat heartbeat-elastic

# Внесём изменение в /etc/filebeat/filebeat.yml
cp -f /root/elk/filebeat.yml /etc/filebeat/
cp -f /root/elk/filebeat_upd.sh /etc/cron.daily/

# Start filebeat
systemctl start filebeat

# Add filebeat to autostart
systemctl enable filebeat

# Get filebeat status
systemctl status filebeat

fi
