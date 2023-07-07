# vpc variable
variable "vpc_new_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "vpc_new_name" {
  type = string
}

# public subnet variable
variable "new_pub_sub_cidr" {
  type = string
}
variable "new_pub_sub_az" {
  type = string
}
variable "new_pub_sub_name" {
  type = string
}

# private subnet variable
variable "new_priv_sub_cidr" {
  type = list(string)
}
variable "new_priv_sub_az" {
  type = list(string)
}
variable "new_priv_sub_name" {
  type = list(string)
}

# Internet gateway
variable "new_Ig_name" {
  type = string
}

# Elastic Ip
variable "new_eip_name" {
  type = string
}

# Nat gateway
variable "new_nat_name" {
  type = string
}
# Public Route Table
variable "new_pub_route_name" {
  type = string
}

# Private Route Table
variable "new_priv_route_name" {
  type = string
}

# Public Sg name
variable "new_pub-sg_name" {
  type = string
}

# Public Sg Tag
variable "new_public_sg_tag" {
  type = string
}

# Ami Id
variable "new_ami_id" {
  type = string
}

# Instance Type
variable "new_instance_type" {
  type = string
}

# Key Name
variable "new_key" {
  type = string
}

# Public Instance Name
variable "new_pub-instance-name" {
  type = string
}

# Private Sg name
variable "new_priv-sg_name" {
  type = string
}

# Private Sg Tag
variable "new_private_sg_tag" {
  type = string
}

# Private Instance Name
variable "new_priv-instance-name" {
   type = list(string)
}







































