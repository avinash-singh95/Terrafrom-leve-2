provider "aws" {
  access_key = "AKIATPCJ7NLZ2IP6UL2B"
  secret_key = "RPKgGvbk3oafUoJL+2zNprhqQan05PraDYqeDcxz"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a23ccb2cdd9286bb"
  instance_type = "t2.micro"
  tags = {
    Name = "myserver"
  }
}

