resource "aws_key_pair" "my_key" {
    key_name = "tf-public_key"
  public_key = file("terraform.pub")
}
resource "aws_default_vpc" "default-vpc" {
  
}
resource "aws_security_group" "tf-SG" {
    name="tf-security-group"
    description = "this created from terraform"
    vpc_id = aws_default_vpc.default-vpc.id

    ingress{
        from_port=80
        to_port=80
        protocol = "tcp"
        cidr_blocks=["0.0.0.0/0"]
        description = "this for http protocol"
    }
    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "this allow all outbound traffic"
    }
    ingress  {
        from_port = 22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
        description = "this for ssh"
    }
    egress {
        from_port=0
        to_port=0
        cidr_blocks=["0.0.0.0/0"]
        protocol="tcp"
        description="this allow all the outbound traffic"

    }
}

resource "aws_instance" "my_ec2" {
    for_each = tomap({
        ec2_one = "t3.micro",
        ec2_two="t3.micro"
    })
    vpc_security_group_ids = [aws_security_group.tf-SG.id]
    ami = "ami-0b6d9d3d33ba97d99"
    instance_type = each.value
    user_data = file("install_ngnix.sh")

    root_block_device {
      volume_size=15
      volume_type="gp3"
    }
  
}



output "aws_instace_public_ip" {
    value = [
        for instace in aws_instance.my_ec2 : instace.public_ip
    ]
  
}
