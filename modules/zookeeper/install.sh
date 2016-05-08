cd /tmp
#wget "http://ftp.ps.pl/pub/apache/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz" -O /tmp/zookeeper.tar.gz
mkdir -p /opt/
mkdir -p /opt/zookeeper && cd /opt/zookeeper
tar xfvz /tmp/zookeeper.tar.gz
cp -R /opt/zookeeper/zookeeper-*/* /opt/zookeeper/
rm -Rf /opt/zookeeper/zookeeper-*/
mv /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg
cp /var/vagrant/vagrant/vagrant/modules/zookeeper/init.d.template /etc/init.d/zookeeper
chmod +x /etc/init.d/zookeeper
update-rc.d zookeeper defaults
service zookeeper start
