# Create Elastic Ip for the Nat gateway
resource "aws_eip" "elastic_ip" {
  vpc = true
  tags = {
    Name = var.eip_name
  }
}
