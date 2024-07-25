terraform {
  backend "s3" {
    bucket = "nurkhat-terraform-states"
    key    = "qa/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "nurkhat-terraform-lock-table"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

