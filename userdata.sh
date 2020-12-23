#! /bin/bash
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install git -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo yum install -y python3.7
sudo yum install -y  python3-pip
python3 -m pip install --user --upgrade pip # Do not run pip as sudo. Do this instead.
python3 -m pip install ansible
python3 -m pip install docker-compose

git clone https://github.com/nick1846/awx-project.git
cd awx-project/installer/
ansible-playbook -i inventory install.yml



 


#  sudo apt update
#  sudo apt install software-properties-common
#  sudo apt-add-repository --yes --update ppa:ansible/ansible
# sudo apt install ansible
# sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# sudo apt-get update -y
# sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
#sudo git clone https://github.com/nick1846/docker.git
#cd /docker/docker-compose
#sudo docker-compose up -d
