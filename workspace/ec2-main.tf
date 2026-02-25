resource "aws_instance" "example" {
  ami           = local.ami_id
  instance_type = lookup(var.instance_type, local.env)
  vpc_security_group_ids = [aws_security_group.allow-tls.id]

  tags = {
    Name = "${var.project}-${local.env}"
    Project = "roboshop"
  }
}


resource "aws_security_group" "allow-tls" {
  name        = "allow-all-terraform-${local.env}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow-all-terraform-${local.env}"
  }
}