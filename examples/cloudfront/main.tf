terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

module "terraform_aws_cloudfront" {
  source= "../../"
  Client= var.Client
  primary_bucket_name = var.primary_bucket_name
  failover_bucket_name= var.failover_bucket_name
  logging_bucket_name= var.logging_bucket_name
  domain_name = var.domain_name
  acl_name= var.acl_name
  acl_description= var.acl_description
  metric_name= var.metric_name
  project_id = var.project_id
}