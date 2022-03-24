output "acl_arn" {
    value= aws_wafv2_web_acl.acl.arn
}

output "acl_id" {
    value = aws_wafv2_web_acl.acl.id
}

output "acl_lockToken" {
    value= aws_wafv2_web_acl.acl.lock_token
}

output "acl_name" {
    value= aws_wafv2_web_acl.acl.name
}