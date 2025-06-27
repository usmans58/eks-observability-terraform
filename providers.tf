provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket       = "eks-cluster-terraform-state-bucket-1"
    key          = "terraform/state"
    region       = "us-west-2"
    use_lockfile = true
  }
}
