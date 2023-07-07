# Create Public route table and associate with public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.IG_id
  }
  tags = {
    Name = var.pub_route_name
  }
}
resource "aws_route_table_association" "rt_pub_sub_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = var.pub_route_table
}

