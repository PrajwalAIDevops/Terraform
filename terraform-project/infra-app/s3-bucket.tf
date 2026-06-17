resource "aws_s3_bucket" "s3-bucket" {
    bucket = "${var.env}-infra-bucket-prajwa10l"
    tags={
        name="${var.env} - infra-bucket"
        Environment = var.env
    }
  
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
    bucket = aws_s3_bucket.s3-bucket.id 
    versioning_configuration {
      status = "Enabled"
    }
  
}

