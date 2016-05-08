cd /tmp
wget "http://ftp.ps.pl/pub/apache/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz" -O /tmp/kafka.tgz
mkdir -p /opt/
mkdir -p /opt/kafka && cd /opt/kafka
tar xfvz /tmp/kafka.tgz
cp /var/vagrant/vagrant/modules/kafka/init.d.template /etc/init.d/
update-rc.d kafka defaults
service kafka start
