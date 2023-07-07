# Create the private subnet
resource "aws_subnet" "Private_subnet" {
  count             = length(var.priv_sub_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = var.priv_sub_cidr[count.index]
  availability_zone = var.priv_sub_az[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = var.priv_sub_name[count.index]
  }
}
