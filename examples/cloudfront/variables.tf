variable "primary_bucket_name" {
    type = string
    description = "Primary Bucket name for S3"
}
variable "failover_bucket_name" {
    type = string
    description = "Failover Bucket name for S3"
}
variable "logging_bucket_name" {
    type = string
    description = "Logging Bucket name for S3"
}
variable "Client" {
    type = string
    description = "Client name for S3"
}  
variable "domain_name" {
  type = string
  description = "Domain name for the ACM"
}

variable "acl_name" {
  type = string
  description = "Name of the web-acl"
}

variable "acl_description" {
  type = string
  description = "description of the acl"
}
variable "metric_name" {
  type = string
  description = "Metric name for web-acl"
}
variable "project_id" {
  type = string
  description = "project id of the project"
}
