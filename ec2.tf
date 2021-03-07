##############################################################
# This configuration file will:                              #
# 1. Create an AWS EC2 instance                              #
# 2. Associate an IAM Key Pair to the AWS EC2 instance       #
# 3. Associate an IAM security group to the AWS EC2 instance #
# 4. Assign a tag to the AWS EC2 instance                    #
##############################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.30.0"
    }
  }
}
provider "aws" {
  profile                 = var.profile
  region                  = var.aws_region
  shared_credentials_file = var.shared_credentials_file
}
resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.aws_security_groups
  tags = {
    Name = "Nginx-Datadog"
  }
  connection {
    type        = var.connection_type
    host        = aws_instance.web.public_ip
    user        = var.connection_user
    port        = var.connection_port
    private_key = file(var.connection_private_key)
    agent       = var.connection_agent
  }
}

