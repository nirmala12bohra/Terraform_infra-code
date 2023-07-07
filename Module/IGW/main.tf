
# Create the Internet gateway
resource "aws_internet_gateway" "Internet_gateway" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.Ig_name
  }
}

