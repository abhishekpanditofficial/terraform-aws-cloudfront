output "primary_bucket_regional_domain_name" {
    value= module.terraform_aws_cloudfront.primary_bucket_regional_domain_name
}

output "primary_bucket_id" {
    value= module.terraform_aws_cloudfront.primary_bucket_id
}

output "failover_bucket_regional_domain_name" {
    value= module.terraform_aws_cloudfront.failover_bucket_regional_domain_name
}

output "failover_bucket_id" {
    value= module.terraform_aws_cloudfront.failover_bucket_id
}
output "logging_bucket_regional_domain_name" {
    value= module.terraform_aws_cloudfront.logging_bucket_regional_domain_name
}

output "logging_bucket_id" {
    value= module.terraform_aws_cloudfront.logging_bucket_id
}
output "record_name" {
   value = module.terraform_aws_cloudfront.record_name
}

output "ACM_ARN" {
    value = module.terraform_aws_cloudfront.ACM_ARN
}

output "record_value" {
    value = module.terraform_aws_cloudfront.record_value
}

output "domain_name" {
    value = module.terraform_aws_cloudfront.domain_name
}

output "acl_arn" {
    value= module.terraform_aws_cloudfront.acl_arn
}

output "acl_id" {
    value = module.terraform_aws_cloudfront.acl_id
}

output "acl_lockToken" {
    value= module.terraform_aws_cloudfront.acl_lockToken
}

output "acl_name" {
    value= module.terraform_aws_cloudfront.acl_name
}
output "cloudfront_arn" {
    value= module.terraform_aws_cloudfront.cloudfront_arn
}
output "cloudfront_id" {
    value= module.terraform_aws_cloudfront.cloudfront_id
}
output "cloudfront_domain_name" {
    value= module.terraform_aws_cloudfront.cloudfront_domain_name
}