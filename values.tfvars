aws_region = "us-east-1"

#my-key-values
my_publickey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDe2Hf/Ykh+TX6Dwby72welAc7WOmjL1aSk2b70S1dmpBF02frhybFeaRNFkn4OC1d6JlJX/wKleC0w0r8Zni6Ae8GqKPhU8WB6kXz7HJDkgB1B8SnGGuYI17KCt1e61hLTJ+XlWAw6rBTM0Kwqcq/GNBKA/wz7tPp1t/Jop1Mj8M9f/HnIZ+Mmidj6O1CiB6XaLM2p1PfLKGrYHnAxE6EJtNbdno7C7A7j7YgMf8L0uXFE33UEZ4+zw8nVVcRxyrFfRP2RDiarRDgYMsKT5R1OVDKqVZIomNn83srFQ6JlnARQbGtg9O2+ClxvfHDHc8ApnbOcUxQ9rpnEhpKokE3l4wyJUFaZYU4Mf/bYwm89Qq7inISVkc+tdSBnxYhDk1K+sXmnEO6OsWjzOiaChkpeAk0bui6fs1O5u07EzKiBVGj80iEOwXuBmcLAesc+cUt7L1Me0qFcIkeD7IrLB/LFF+H7si//vn/qxsJ+a+3UY2thI1dRVpikpoBM+GWk9zs= nick@my-laptop"


#my-eip-values
eip_count = 1
vpc_bool  = "true"

#my-vpc-values

my_vpc_name             = "terra-2-vpc"
my_vpc_cidr             = "10.0.0.0/16"
my_vpc_azs              = ["us-east-1a", "us-east-1b"]
my_vpc_private_subnets  = ["10.0.1.0/24"]
my_vpc_public_subnets   = ["10.0.100.0/24"]
my_vpc_nat_gateway_bool = "false"
my_vpc_tags             = { Name = "terra-2-vpc"}
my_public_subnets_tags  = { Name = "terra-2-public-subnet-a" }
my_private_subnets_tags = { Name = "terra-2-private-subnet-a" }
my_igw_tags             = { Name = "terra-2-igw" }

#my-sg-values

my_sg_name       = "my-sg"
sg_description   = "Security group for web-server and ssh access"
sg_ingress_cidr  = ["0.0.0.0/0"]
sg_ingress_rules = ["https-443-tcp", "http-80-tcp", "ssh-tcp", "http-8080-tcp"]
sg_egress_cidr   = ["0.0.0.0/0"]
sg_egress_rules  = ["all-all"]

#my-ec2-values

my_ec2_name = "web-server"
ec2_count   = 1
ec2_type    = "t2.micro" 
ec2_tags    = { Name = "web-server"}

#my-data-source-values

most_recent_bool = "true"
ami_tag_type     = "name"
ami_value        = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
ami_owner        = ["099720109477"]







