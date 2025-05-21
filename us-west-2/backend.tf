terraform {
  backend "s3" {
    bucket         = "tf-backend-54321-us-east-1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
    role_arn       = "arn:aws:iam::54321:role/ExecutionRole"
  }
}

provider "aws" {
  region         = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::54321:role/ExecutionRole"
    session_name = "GitHubTerraformSession"
  }
}
