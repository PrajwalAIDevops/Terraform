terraform {
  backend "s3" {
    bucket = "prajwal1027s3"
    region = "us-east-1"
    key="terraform.tfstate"
    dynamodb_table = "prajwal-dynamodb"
  }
}