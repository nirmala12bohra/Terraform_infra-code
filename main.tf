module "vpc" {
  source   = "./Module/vpc"
  vpc_cidr = var.vpc_new_cidr
  vpc_name = var.vpc_new_name
}

module "public_subnet" {
  source       = "./Module/pub_subnet"
  pub_sub_cidr = var.new_pub_sub_cidr
  pub_sub_az   = var.new_pub_sub_az
  pub_sub_name = var.new_pub_sub_name
  vpc_id       = module.vpc.vpc_id
}

module "private_subnet" {
  source        = "./Module/priv_subnet"
  priv_sub_cidr = var.new_priv_sub_cidr
  priv_sub_az   = var.new_priv_sub_az
  priv_sub_name = var.new_priv_sub_name
  vpc_id        = module.vpc.vpc_id
}

module "Internet_Gateway" {
  source  = "./Module/IGW"
  vpc_id  = module.vpc.vpc_id
  Ig_name = var.new_Ig_name
}

module "elastic_ip" {
  source   = "./Module/Elastic_Ip"
  eip_name = var.new_eip_name
}

module "Nat_gateway" {
  source           = "./Module/NAT"
  elastic_ip       = module.elastic_ip.elastic_ip
  public_subnet_id = module.public_subnet.public_subnet_id
  nat_name         = var.new_nat_name

}

module "public_Route_Table" {
  source           = "./Module/Pub_RT"
  vpc_id           = module.vpc.vpc_id
  IG_id            = module.Internet_Gateway.IG_id
  pub_route_name   = var.new_pub_route_name
  public_subnet_id = module.public_subnet.public_subnet_id
  pub_route_table  = module.public_Route_Table.pub_route_table
}

module "private_Route_Table" {
  source            = "./Module/Priv_RT"
  vpc_id            = module.vpc.vpc_id
  Nat_id            = module.Nat_gateway.Nat_id
  priv_route_name   = var.new_priv_route_name
  private_subnet_id = module.private_subnet.private_subnet_id
  priv_route_table  = module.private_Route_Table.priv_route_table
}

module "Pub_Security-gp" {
  source            = "./Module/Public-Security_group"
  vpc_id            = module.vpc.vpc_id
  pub-sg_name       = var.new_pub-sg_name
  public_sg_tag     = var.new_public_sg_tag
}

module "Public_Instance" {
  source            = "./Module/Public_Instance"
  public_subnet_id  = module.public_subnet.public_subnet_id
  ami_id            = var.new_ami_id
  instance_type     = var.new_instance_type
  key_name          = var.new_key
  Pub_sg            = module.Pub_Security-gp.Pub_sg
  pub-instance-name = var.new_pub-instance-name

}

module "Priv_Security-gp" {
  source            = "./Module/Private-Security_group"
  vpc_id            = module.vpc.vpc_id
  priv-sg_name      = var.new_priv-sg_name
  private_sg_tag    = var.new_private_sg_tag
}

module "Private_Instance" {
  source             = "./Module/Private_Instance"
  private_subnet_id  = module.private_subnet.private_subnet_id
  ami_id             = var.new_ami_id
  instance_type      = var.new_instance_type
  key_name           = var.new_key
  Priv_sg            = module.Priv_Security-gp.Priv_sg
  priv_instance_name = var.new_priv-instance-name

}


































