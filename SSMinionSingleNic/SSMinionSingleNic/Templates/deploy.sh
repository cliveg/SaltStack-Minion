yum -y install python-pip
yum -y install epel-release
yum -y install zeromq
yum -y install salt-minion
yum -y --enablerepo=epel-testing install salt-minion
chkconfig salt-minion on
service salt-minion start
salt-minion
