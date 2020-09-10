provider "aws" {
  region = "us-east-1"
}

terraform {
    backend "s3" {
        bucket = "terraform-training-state-cm"
        region = "us-east-1"
        key = "workspaces-example/terraform.tfstate"
        dynamodb_table = "terraform-training-locks"
        encrypt = true
    }
}

resource "aws_instance" "example" {
  ami = "ami-0bcc094591f354be2"
  instance_type = "t2.micro"

  tags = {
      user = "willbrid"
  }
}