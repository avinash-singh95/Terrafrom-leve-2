
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


  user_data = file("script.sh")

  
 
}


 output "instance_ip" {
    value       = aws_instance.example.public_ip
    
  }
