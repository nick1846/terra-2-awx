aws_region = "us-east-1"

#my-key-values
my_publickey = ""

#my-eip-values

vpc_bool = "true"

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
ami_tag_type     = "AMI Name"
ami_value        = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
ami_owner        = ["099720109477"]







