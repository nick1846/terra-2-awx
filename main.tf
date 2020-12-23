provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "ec2-user-public" {
  key_name   = var.my_key_name  
  public_key = var.my_publickey
}

resource "aws_eip" "for_each" {
  count    = var.eip_count
  vpc      = var.vpc_bool
  instance = element(module.my_ec2.id, count.index)  
}

module "my_vpc" {
  source              = "terraform-aws-modules/vpc/aws"
  name                = var.my_vpc_name
  cidr                = var.my_vpc_cidr
  azs                 = var.my_vpc_azs
  private_subnets     = var.my_vpc_private_subnets
  public_subnets      = var.my_vpc_public_subnets
  enable_nat_gateway  = var.my_vpc_nat_gateway_bool
  vpc_tags            = var.my_vpc_tags
  public_subnet_tags  = var.my_public_subnets_tags  
  private_subnet_tags = var.my_private_subnets_tags
  igw_tags            = var.my_igw_tags
  
}


module "my_sg" {
  source              = "terraform-aws-modules/security-group/aws" 
  name                = var.my_sg_name
  description         = var.sg_description
  vpc_id              = module.my_vpc.vpc_id
  ingress_cidr_blocks = var.sg_ingress_cidr
  ingress_rules       = var.sg_ingress_rules  
  egress_cidr_blocks  = var.sg_egress_cidr 
  egress_rules        = var.sg_egress_rules
}

module "my_ec2" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  name                   = var.my_ec2_name
  key_name               = var.my_key_name 
  instance_count         = var.ec2_count
  ami                    = data.aws_ami.my_ami.id
  instance_type          = var.ec2_type
  vpc_security_group_ids = [ module.my_sg.this_security_group_id ]
  subnet_id              = element(module.my_vpc.public_subnets, 0)
  user_data              = file("userdata.sh")
  tags                   = var.ec2_tags  
}

data "aws_ami" "my_ami" {
  most_recent = var.most_recent_bool
  filter {
    name    = var.ami_tag_type
    values  = var.ami_value
  }
  owners      = var.ami_owner
}


