#!/bin/bash

# Run as root?
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
else

# Firewalld stop
systemctl disable firewalld
systemctl stop firewalld

# Install java
yum -y install java-openjdk-devel java-openjdk

# Copy file elasticsearch.repo to /etc/yum.repos.d/
cp -f /root/elk/elasticsearch.repo /etc/yum.repos.d/

# Import key of elasticsearch repo
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

# Delete all downloads packets rpm
yum -y clean all

# Make cache
yum -y makecache

# Install Elasticsearch
yum -y install elasticsearch

# See installed elasticsearch packet
rpm -qi elasticsearch

# Copy file jvm.options
cp -f /root/elk/jvm.options /etc/elasticsearch/jvm.options.d/

# Start elasticsearch
systemctl start elasticsearch.service

# Add elasticsearch to autostart
systemctl enable elasticsearch.service

# Get elasticsearch status
systemctl status elasticsearch.service

# Testing
curl http://127.0.0.1:9200

# Install kibana
yum -y install kibana

# Copy file kibana.yml into /etc/kibana/
cp -f /root/elk/kibana.yml /etc/kibana/

# Start kibana
systemctl start kibana

# Add kibana to autostart
systemctl enable kibana

# Get kibana status
systemctl status kibana

# Install Logstash
yum -y install logstash
# yum -y install logstash filebeat auditbeat metricbeat packetbeat heartbeat-elastic

# Copy file logstash.yml into /etc/logstash/
cp -f /root/elk/logstash.yml /etc/logstash/

# Copy config file logstash-nginx-es.conf into /etc/logstash/conf.d/
cp -f /root/elk/logstash-nginx-es.conf /etc/logstash/conf.d/

# Restart logstash
systemctl start logstash.service

# Restart logstash
systemctl enable logstash.service

# Restart logstash
systemctl status logstash.service

fi
