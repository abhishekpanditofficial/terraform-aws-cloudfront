output "primary_bucket_regional_domain_name" {
    value= module.aws_s3_primary.bucket_regional_domain_name
}

output "primary_bucket_id" {
    value= module.aws_s3_primary.bucket_id
}

output "failover_bucket_regional_domain_name" {
    value= module.aws_s3_failover.bucket_regional_domain_name
}

output "failover_bucket_id" {
    value= module.aws_s3_failover.bucket_id
}
output "logging_bucket_regional_domain_name" {
    value= module.aws_s3_logging.bucket_regional_domain_name
}

output "logging_bucket_id" {
    value= module.aws_s3_logging.bucket_id
}
output "record_name" {
   value = module.acm_certificate.record_name
}

output "ACM_ARN" {
    value = module.acm_certificate.ARN
}

output "record_value" {
    value = module.acm_certificate.record_value
}

output "domain_name" {
    value = module.acm_certificate.domain_name
}

output "acl_arn" {
    value= module.aws_waf.acl_arn
}

output "acl_id" {
    value = module.aws_waf.acl_id
}

output "acl_lockToken" {
    value= module.aws_waf.acl_lockToken
}

output "acl_name" {
    value= module.aws_waf.acl_name
}
output "cloudfront_arn" {
    value= module.aws_cloudfront.cloudfront_arn
}
output "cloudfront_id" {
    value= module.aws_cloudfront.cloudfront_id
}
output "cloudfront_domain_name" {
    value= module.aws_cloudfront.cloudfront_domain_name
}