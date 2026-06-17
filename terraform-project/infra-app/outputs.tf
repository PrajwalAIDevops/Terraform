output "ec2_instace_public_ip" {
  value = aws_instance.infra_ec2[*].id
}
output "security_group" {
  value = aws_s3_bucket.s3-bucket.bucket_domain_name
}