
# Create the Security Group for public instance
resource "aws_security_group" "Public_sg" {
  vpc_id      = var.vpc_id 
  name        = var.pub-sg_name
  description = "Security group for the public instance"
   tags = {
    Name = var.public_sg_tag
  }
  
  # Allow all inbound traffic
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # Allow outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

