#! /bin/bash
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install git -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo yum install -y  python3-pip
python3 -m pip install --user --upgrade pip # Do not run pip as sudo. Do this instead.
python3 -m pip install ansible
python3 -m pip install docker-compose

mkdir awx
cd awx/
git clone https://github.com/nick1846/linux-users-role.git
git clone https://github.com/nick1846/awx-project.git
cd awx-project/installer/
ansible-playbook -i inventory install.yml


cd ../../linux-users-role/
ansible-playbook -i hosts.yaml main.yaml

