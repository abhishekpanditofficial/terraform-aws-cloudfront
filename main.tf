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
  access_key = "AKIA2EFS3QBOJBQI6M33"
  secret_key = "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"
}

module "aws_s3_primary" {
  source= "./modules/s3"
  bucket_name= var.primary_bucket_name
  Client= var.Client
}

module "aws_s3_failover" {
  source= "./modules/s3"
  bucket_name= var.failover_bucket_name
  Client= var.Client    
}
module "aws_s3_logging" {
  source= "./modules/s3"
  bucket_name= var.logging_bucket_name
  Client= var.Client    
}


module "acm_certificate" {
  source= "./modules/acm"
  domain_name= var.domain_name
  Client= var.Client
}


module "aws_waf" {
  source= "./modules/waf"
  acl_name= var.acl_name
  acl_description= var.acl_description
  metric_name= var.metric_name
  Client= var.Client
}



// cloudfront
module "aws_cloudfront" {
  source= "./modules/cloudfront"
  primary_bucket_regional_domain_name= module.aws_s3_primary.bucket_regional_domain_name
  failover_bucket_regional_domain_name= module.aws_s3_failover.bucket_regional_domain_name
  primary_id= module.aws_s3_primary.bucket_id
  failover_id= module.aws_s3_failover.bucket_id
  web_acl_arn= module.aws_waf.acl_arn
  acm_arn= module.acm_certificate.ARN
  logging_bucket = module.aws_s3_logging.bucket_regional_domain_name
  Client= var.Client
}