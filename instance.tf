provider "aws" {
  region     = var.region
}

resource "aws_instance" "myserver" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "myserver"
  }
}

