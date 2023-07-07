# Create the Nat gateway
resource "aws_nat_gateway" "Nat_gateway" {
  allocation_id = var.elastic_ip
  subnet_id     = var.public_subnet_id
  tags = {
    Name = var.nat_name
  }
}

