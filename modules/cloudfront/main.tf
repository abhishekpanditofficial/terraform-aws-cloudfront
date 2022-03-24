# CloudFront distributions take about 15 minutes to a deployed state after creation or modification. During this time, deletes to resources will be blocked. If you need to delete a distribution that is enabled and you do not want to wait, you need to use the retain_on_delete flag.


locals {
  kit_proxy_lb      = "kit_proxy_lb_ttty"
  s3_grp_origin_id  = "groupS3"
  s3_prim_origin_id = "primaryS3"
  s3_fail_origin_id = "failoverS3"
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "origin-access-identity/${var.primary_bucket_regional_domain_name}"

}



resource "aws_cloudfront_distribution" "Client_Cloudfront_Instance" {
  origin_group {
    origin_id = local.s3_grp_origin_id

    failover_criteria {
      status_codes = [403, 404, 500, 502, 503, 504]
    }

    member {
      origin_id = local.s3_prim_origin_id
    }

    member {
      origin_id = local.s3_fail_origin_id
    }
  }

  origin {
    domain_name = var.primary_bucket_regional_domain_name
    # origin_path = var.project_id
    origin_id   = local.s3_prim_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  origin {
    domain_name = var.failover_bucket_regional_domain_name
    # origin_path = var.project_id
    origin_id   = local.s3_fail_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for assets for client production Env"
  default_root_object = ""
  web_acl_id = var.web_acl_arn

  logging_config {
    include_cookies = false
    bucket          = var.logging_bucket
    prefix          = var.Client
  }

  default_cache_behavior {
    allowed_methods  = ["HEAD","GET","OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_grp_origin_id 

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_prim_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_prim_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "IN", "GB"]
    }
  }

  tags = {
    "ENV"   = "PRODUCTION"
    "CLENT" = var.Client
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    # acm_certificate_arn            = var.acm_arn
    # ssl_support_method             = "sni-only" 
  }

}