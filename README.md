# elk
# Enter with root
sudo -i

# Rename host
hostnamectl set-hostname elk

# Edit network setting (Warning: the network card make internal)
vi /etc/sysconfig/network-scripts/ifcfg-enp0s3

# comment line BOOTPROTO="dhcp"
#BOOTPROTO="dhcp"

# add next lines
BOOTPROTO="static"
IPADDR=10.0.1.22
NETMASK=255.255.255.0
GATEWAY=10.0.1.1
DNS1=10.0.1.1
DNS2=8.8.8.8

# Restart host
shutdown -r now

# Enter with root
sudo -i

# Install git
yum -y install git

# Connect to GitHub repo for download to host
git clone https://github.com/SergSha/elk.git

#------- For to upload to GitHub -------------
# Make pair keys
#ssh-keygen #Enter-Enter-Enter
# Copy text of pub key and paste into GitHub:
#cat /root/.ssh/id_rsa.pub
#https://github.com/settings/keys
# Connect to GitHub repo (elk)
#git clone git@github.com:SergSha/elk.git
------------------------------------------------

# Make the file inst_set.sh execute
chmod u+x /root/elk/inst_set.sh

# Start inst_set.sh
/root/elk/inst_set.sh

# -------------- CLIENT HOST --------------
# Start filebeat_inst.sh on CLIENT host
/root/elk/filebeat_inst.sh

# Attention: filebeat.yml
# In block ----- Logstash Output -----
# host: [localhost:5400] -> host: [<IP Logstash host>:5400]
# Example: host: [10.0.1.22:5400]

# -------------- BROWSER ------------------
# Start browser and enter http://<IP balancer>:5601
# Explore on my out
# Discover
# Create index pattern (You can also create an index pattern against hidden or system indices.)
# Field Name - weblogs*, Timestamp field - @timestamp
# Create index pattern
# Go to Discover again
# Dashboard
# Create new dashboard
# Create visualization
# Bar vertical stacked -> Bar horizontal
# In left column in search field enter "request"
# Position "request.keyword" with mouse put on central area of page
# Get horozontal diagram
# Save and return

# Bar vertical stacked -> Pie
# In right column in "Slice by" select "response"
# In "Size by" select "Records"
# Get sector diagram
# Save and return
# Put button "Save" and give name "MyDashboard"
