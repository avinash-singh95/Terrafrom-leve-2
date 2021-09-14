provider "aws" {
  access_key = "AKIATPCJ7NLZRVSQZJHB"
  secret_key = "41Soy9F7cIE2qCUtSQwyPvqaF5GWOS8N49hLFSH7"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a23ccb2cdd9286bb"
  instance_type = "t2.micro"
  tags = {
    Name = "myserver"
  }
}

