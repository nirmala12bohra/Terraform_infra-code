# Create Private route table and associate with private subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.Nat_id
  }
  tags = {
    Name = var.priv_route_name
  }
}
resource "aws_route_table_association" "rt_priv_sub_association" {
  count          = length(var.private_subnet_id)
  subnet_id      = var.private_subnet_id[count.index]
  route_table_id = var.priv_route_table
}



