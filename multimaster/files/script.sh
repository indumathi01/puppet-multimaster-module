#! /bin/sh

echo 192.168.1.24 puppetmulti.zippyops.com >> /etc/hosts
puppet agent -t
systemctl start puppetserver
