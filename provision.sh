#!/usr/bin/env bash

export DEBCONF_NONINTERACTIVE_SEEN="true";
export DEBIAN_FRONTEND="noninteractive";

update-alternatives --set editor /bin/nano;
touch /etc/profile.d/editor.sh;
echo "export EDITOR=nano" >> /etc/profile.d/editor.sh;

apt-get update;
apt-get install -qqy linux-headers-generic software-properties-common htop mtr tmux wget ca-certificates p7zip-full python3-pip git xorg;

pip3 install -q -I ansible==2.8.1;
pip3 install -q -I awscli boto boto3 botocore dnspython netaddr;

add-apt-repository -y ppa:webupd8team/atom;
apt-get update -qq;
apt-get install -qqy atom;

echo -e "\
[defaults]\n\
inventory = /home/vagrant/ansible/hosts\n\
vault-password-file = /home/vagrant/ansible/ansible_vault\n\
roles_path = /home/vagrant/ansible/roles" > /home/vagrant/ansible/ansible.cfg;

echo -e "[nginx]\nlocalhost" > /home/vagrant/ansible/hosts;

set -x;

chown -R vagrant: /home/vagrant/ansible;
cd /home/vagrant/ansible;

ansible-playbook -c local projects/nginx-server.yml;
