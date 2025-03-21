provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "demo_server" {
  ami = "ami-0277155c3f0ab2930"
  instance_type = "t2.micro"
  key_name = "dpp"
  security_groups = [ "demo_sg" ]
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "ssh access"

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh_port"
  }
}