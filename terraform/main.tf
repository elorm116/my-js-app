terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
}

# Get existing VPC
data "aws_vpc" "existing" {
  id = var.vpc_id
}

# Get existing subnet
data "aws_subnet" "existing" {
  id = var.subnet_id
}



# Security Group
resource "aws_security_group" "app_sg" {
  name_prefix = "${var.app_name}-sg"
  description = "Security group for ${var.app_name}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
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
    Name = "${var.app_name}-sg"
  }
}

# EC2 Instance
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  # Enable public IP assignment if the subnet doesn't auto-assign
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y docker
    systemctl start docker
    systemctl enable docker
    usermod -aG docker ubuntu
  EOF

  tags = {
    Name = "${var.app_name}-server"
  }
}
