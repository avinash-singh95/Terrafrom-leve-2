provider "aws" {
  access_key = "AKIATPCJ7NLZY6MW56WZ"
  secret_key = "+YaTbTE+IQFnY1ZNmSLq9Y+bvf/QMgKMtqwn2vgw"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a23ccb2cdd9286bb"
  instance_type = "t2.micro"
  tags = {
    Name = "myserver"
  }
}

