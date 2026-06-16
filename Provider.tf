terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Specifies the provider version
    }
  }
}

# The block remains completely empty; it pulls keys from your system automatically
provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}


