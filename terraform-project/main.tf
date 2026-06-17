module "stg-app" {
  source = "./infra-app"
  env="stg"
  ami="ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  instance_count = 2
  hash_key = "dev-infra-app"
}

# *************************************************

module "prd-app" {
  source = "./infra-app"
  env="prd"
  ami="ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  instance_count = 2
  hash_key = "dev-infra-app"
}

#//////////////////////////////////////////////////////

module "dev-app" {
  source = "./infra-app"
  env="dev"
  ami="ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  instance_count = 2
  hash_key = "dev-infra-app"
}