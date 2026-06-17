resource "aws_key_pair" "my_key" {
    key_name="${var.env}-infra-key"
    public_key = file("${path.module}/terraform.pub")
tags={
    name="${var.env}infra-key"
    Environment = var.env
}
}

resource "aws_default_vpc" "infra_vpc" {
  
}
resource "aws_security_group" "infra-security-group" {
    name="${var.env}-infra-SG"
    vpc_id = aws_default_vpc.infra_vpc.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags ={
        name="${var.env}-infra-SG"
        Environment = var.env
    }
  
}

resource "aws_instance" "infra_ec2" {
    count=var.instance_count
  ami=var.ami
  vpc_security_group_ids = [aws_security_group.infra-security-group.id]
  instance_type = var.instance_type
  root_block_device {
    volume_size = var.env=="prd"?20:10 
    volume_type = "gp3"
  }
  tags={
    name="${var.env}-ec2-instance"
    Environment = var.env
  }
}