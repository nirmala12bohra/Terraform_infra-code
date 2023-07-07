# Create the public subnet
resource "aws_subnet" "Public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pub_sub_cidr
  availability_zone = var.pub_sub_az
  map_public_ip_on_launch = true
  

  tags = {
    Name = var.pub_sub_name
  }
}