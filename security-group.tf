#############################################
# This configuration file will:             #
# 1. Create an AWS security group           #
# 2. Allow TLS                              #
# 3. Allow SSH                              #
# 4. Assign a tag to the AWS security group # 
#############################################

resource "aws_security_group" "WebServerSG" {
  name        = var.aws_security_group_name
  description = "Create a security group"

  ingress {
    description = "TLS"
    from_port   = var.ingress_1
    to_port     = var.ingress_1
    protocol    = var.ingress_protocol
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    description = "SSH"
    from_port   = var.ingress_2
    to_port     = var.ingress_2
    protocol    = var.ingress_protocol
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "Nginx-Datadog"
  }
}
