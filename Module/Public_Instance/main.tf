# Creating EC2 instance in public Subnet
resource "aws_instance" "public_Instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.Pub_sg]               
  subnet_id              = var.public_subnet_id  
  associate_public_ip_address = true   
  tags = {
    Name = var.pub-instance-name
  }
}


