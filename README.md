<h3>elk</h3>

<p>Enter with root</p>
sudo -i

<p>Rename host</p>
hostnamectl set-hostname elk

<p>Edit network setting (Warning: the network card make internal)</p>
vi /etc/sysconfig/network-scripts/ifcfg-enp0s3

<p>comment line BOOTPROTO="dhcp"</p>
#BOOTPROTO="dhcp"

<p>add next lines</p>
BOOTPROTO="static"
IPADDR=10.0.1.22
NETMASK=255.255.255.0
GATEWAY=10.0.1.1
DNS1=10.0.1.1
DNS2=8.8.8.8

<p>Restart host</p>
shutdown -r now

<p>Enter with root</p>
sudo -i

<p>Install git</p>
yum -y install git

<p>Connect to GitHub repo for download to host</p>
git clone https://github.com/SergSha/elk.git

<p>==================For to upload to GitHub==================</p>
<p>Make pair keys
<pre>ssh-keygen
Enter
Enter
Enter</pre>

<p>Copy text of pub key and paste into GitHub:</p>
<pre>cat /root/.ssh/id_rsa.pub</pre>
<pre>https://github.com/settings/keys</pre>

<p>Connect to GitHub repo (elk)</p>
<pre>git clone git@github.com:SergSha/elk.git</pre>
<p>====================================================</p>

<p>Make the file inst_set.sh execute</p>
<pre>chmod u+x /root/elk/inst_set.sh</pre>

<p>Start inst_set.sh</p>
<pre>/root/elk/inst_set.sh</pre>

<p>========================CLIENT HOST========================</p>
<p>Start filebeat_inst.sh on CLIENT host</p>
<pre>/root/elk/filebeat_inst.sh</pre>

<pre>Attention: filebeat.yml
In block ----- Logstash Output -----
host: [localhost:5400] -> host: [<IP Logstash host>:5400]
Example: host: [10.0.1.22:5400]</pre>

<p>==========================BROWSER==========================</p>
<ul>
<li>Start browser and enter http://<IP balancer>:5601</li>
<li>Explore on my out</li>
<li>Discover</li>
<li>Create index pattern (You can also create an index pattern against hidden or system indices.)</li>
<li>Field Name - weblogs*, Timestamp field - @timestamp</li>
<li>Create index pattern</li>
<li>Go to Discover again</li>
<li>Dashboard</li>
<li>Create new dashboard</li>
<li>Create visualization</li>
<li>Bar vertical stacked -> Bar horizontal</li>
<li>In left column in search field enter "request"</li>
<li>Position "request.keyword" with mouse put on central area of page</li>
<li>Get horozontal diagram</li>
<li>Save and return</li>
</ul>
<ul>
<li>Bar vertical stacked -> Pie</li>
<li>In right column in "Slice by" select "response"</li>
<li>In "Size by" select "Records"</li>
<li>Get sector diagram</li>
<li>Save and return</li>
<li>Put button "Save" and give name "MyDashboard"</li>
</ul>
