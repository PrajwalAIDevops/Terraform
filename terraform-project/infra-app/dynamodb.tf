resource "aws_dynamodb_table" "dynamodb" {
    name="${var.env}-dynamodb"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = var.hash_key

    attribute {
      name=var.hash_key
      type = "S"
    }
    tags = {
      name="${var.env}-infra-dynamodb"
    }
}