/* This is a multi-line comment. This is a multi-line comment.
This is a multi-line comment. This is a multi-line comment. This
is a multi-line comment. This is a multi-line comment. */
provider "aws" {
  region = "us-east-1"
}

# This is a single-line comment.
resource "aws_instance" "base" {
  ami = "ami-0083662ba17882949"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}