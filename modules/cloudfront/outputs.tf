output "cloudfront_arn" {
    value= aws_cloudfront_distribution.Client_Cloudfront_Instance.arn
}
output "cloudfront_id" {
    value= aws_cloudfront_distribution.Client_Cloudfront_Instance.id
}
output "cloudfront_domain_name" {
    value= aws_cloudfront_distribution.Client_Cloudfront_Instance.domain_name
}