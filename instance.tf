
terraform {
  backend "s3" {
    bucket = "serverbucket1"
    key    = "avi/backendbucket"
    region = "ap-south-1"
  }
}




resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.myapp-sg.id]
  associate_public_ip_address  = true


  user_data = file("script.sh")

  
 
}


 output "instance_ip" {
    value       = aws_instance.example.public_ip
    
  }


  module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = var.vpc_cidr

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}


