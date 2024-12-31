# Creating Security Group

resource "aws_security_group" "allow_tls" {
  name        = "ec2-sg-1"
  description = "Allow for Ec2 Access"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description      = "security group for ec2"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}