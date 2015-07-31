cp /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth1
sed -i "s/^DEVICE=.*/DEVICE=eth1/I" "/etc/sysconfig/network-scripts/ifcfg-eth1" 
defaultgw=$(ip route show |sed -n "s/^default via //p")
declare -a gateway=(${defaultgw// / })
sed -i "\$aGATEWAY=${gateway[0]}" /etc/sysconfig/network
service network restart
cd /tmp
yum -y install python-pip
yum -y install epel-release
yum -y install zeromq
yum -y install salt-minion
yum -y --enablerepo=epel-testing install salt-minion
chkconfig salt-minion on
service salt-minion start
salt-minion
