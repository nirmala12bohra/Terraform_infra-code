
# Creating EC2 instance in private Subnet
resource "aws_instance" "private_Instance" {
  count                  = length(var.private_subnet_id)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.Priv_sg]
  subnet_id              = var.private_subnet_id[count.index]
  tags = {
    Name = var.priv_instance_name[count.index]
  }
}

