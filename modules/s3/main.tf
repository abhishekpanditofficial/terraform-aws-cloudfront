resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "rule-1"

     expiration {
      days = 365
    }

    filter {
      and {
        prefix = "assets"
        tags   = {
          "ENV" = "production"
          "Client" = var.Client
         }
      }
    }

    status = "Enabled"
  }
    rule {
    id = "rule-2"

     expiration {
      days = 365
    }

    filter {
      and {
        prefix = "failover"
        tags   = {
          "ENV" = "production"
          "Client" = var.Client
         }
      }
    }

    status = "Enabled"
  }
}