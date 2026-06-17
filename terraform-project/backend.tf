/* terraform {
  backend "s3" {
    bucket = "${var.env}-infra-bucket-prajwa10l"
    dynamodb_table = "${var.env}-dynamodb"
    region = "us-east-1"
    key="${var.env}/terraform.tfstate"
    encrypt = true
  }
} */