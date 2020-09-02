/* This is a multi-line comment. This is a multi-line comment.
This is a multi-line comment. This is a multi-line comment. This
is a multi-line comment. This is a multi-line comment. */
provider "aws" {
  region = "us-east-1"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 8080
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  
  ingress {
    from_port = var.server_port
    to_port = var.server_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# This is a single-line comment. ami-0bcc094591f354be2 for ubuntu 18.04
resource "aws_instance" "base" {
  ami = "ami-0083662ba17882949"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

  tags = {
    Name = "terraform-example"
  }
}

output "public_ip" {
  value = aws_instance.base.public_ip
  description = "The public IP address of the web server"
}