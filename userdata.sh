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

cd /home/ec2-user/
git clone https://github.com/nick1846/awx-configure-tower.git
git clone https://github.com/nick1846/linux-users-role.git
git clone https://github.com/nick1846/awx.git

cd /home/ec2-user/awx/installer/
ansible-playbook -i inventory install.yml

cd /home/ec2-user/
ansible-galaxy collection install awx.awx

cd /home/ec2-user/awx-configure-tower/
ansible-playbook -i hosts main.yaml

cd /home/ec2-user/linux-users-role/
ansible-playbook -i hosts.yaml main.yaml


