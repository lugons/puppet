#!/bin/bash

echo 'deb http://backports.debian.org/debian-backports squeeze-backports main' >/etc/apt/sources.list.d/backports.list
cat >/etc/apt/preferences.d/backports <<EOF
Package: *
Pin: release a=squeeze-backports
Pin-Priority: 500
EOF

apt-get update
apt-get -y install puppet puppetmaster git-core
rm -rf /etc/puppet
cd /etc
git clone git://github.com/lugons/puppet.git
mkdir -p /etc/puppet/ssl/ca/requests
chown -R puppet:puppet /etc/puppet
sed -i 's:START=no:START=yes:g' /etc/default/puppet
puppetca --generate --certdnsnames puppet:puppet.lugons.org localhost
puppet cert clean $(hostname).lugons.org
rm -f /var/lib/puppet/ssl/certs/$(hostname).lugons.org.pem
puppet agent -t
/etc/init.d/puppetmaster restart
/etc/init.d/puppet restart
puppetca -s $(hostname).lugons.org
/etc/init.d/puppet restart
tail -n 0 -f /var/log/daemon.log
