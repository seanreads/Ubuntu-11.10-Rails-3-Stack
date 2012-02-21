#!/bin/sh
# install.sh - install and configure Ruby 1.9.2 / RoR / mySQL stack 
# Author: Sean O'Donnell
# Date: 02/21/2012

if [ -z $1 ] || [ ! -r $1 ]; then 
   echo "Unable to read file. Check for existence and permissions."
   exit
fi 

apt-get -y update
apt-get -y upgrade
cat $1 | xargs apt-get -y install
update-alternatives --set ruby /usr/bin/ruby1.9.1
update-alternatives --set gem /usr/bin/gem1.9.1
gem install rubygems-update --no-ri --no-rdoc
update_rubygems
gem install rake --no-ri --no-rdoc
gem install bundler --no-ri --no-rdoc
gem install sinatra --no-ri --no-rdoc
