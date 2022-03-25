variable "primary_bucket_regional_domain_name" {
    type = string
    description = "primary s3 bucket name"
}

variable "failover_bucket_regional_domain_name" {
    type = string
    description = "failover s3 bucket name"
}
variable "logging_bucket" {
    type = string
    description = "Logging bucket"
}

variable "web_acl_arn" {
    type = string
    description = "ARN of the web acl"
}

variable "acm_arn" {
    type = string
    description = "ARN of the ACM"
}

variable "Client" {
    type = string
    description = "name of the client"
}
variable "primary_id" {
    type = string
    description = "name of the client"
}
variable "failover_id" {
    type = string
    description = "name of the client"
}