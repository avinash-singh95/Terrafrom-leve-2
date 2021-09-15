data "aws_ip_ranges" "european_ec2" {
  regions  = ["ap-south-1", "ap-southeast-1"]
  services = ["ec2"]
}

resource "aws_security_group" "from_india" {
  name = "from_india"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = slice(data.aws_ip_ranges.european_ec2.cidr_blocks, 0, 10)
  }
  tags = {
    CreateDate = data.aws_ip_ranges.european_ec2.create_date
    SyncToken  = data.aws_ip_ranges.european_ec2.sync_token
  }
}

