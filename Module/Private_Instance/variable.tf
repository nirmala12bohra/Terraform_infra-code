variable "ami_id" {
 type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "priv_instance_name" {
  type = list(string)
}


variable "Priv_sg" {
  type = string
}

variable "private_subnet_id" {
  type = list(string)
}






