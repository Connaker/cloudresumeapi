
resource "aws_cloudfront_distribution" "cdn" {
  enabled             = var.enable_cdn
  default_root_object = var.cdn_default_root_object

  origin {
    domain_name = var.cdn_s3_domain_name
    origin_id = var.cdn_s3_origin_id
  }

  origin {
    domain_name = var.cdn_api_domain_name
    origin_id   = var.cdn_api_origin_id
    origin_path = var.cdn_api_origin_path
  }
  
  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    viewer_protocol_policy = var.default_cache_behavior_viewer_protocl_policy
    target_origin_id = var.default_cache_behavior_target_origin_id
    forwarded_values {
      query_string = var.default_cache_behavior_forwarded_values_query_string
      cookies {
        forward = var.default_cache_behavior_forrwarded_values_cookies_forward
      }
    }
  }

  ordered_cache_behavior {
    path_pattern           = var.ordered_cache_behavior_path_pattern
    target_origin_id       = var.ordered_cache_behavior_target_origin_id
    viewer_protocol_policy = var.ordered_cache_behavior_viewer_portocol_policy
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
       query_string = var.ordered_cache_behavior_forwarded_values_query_string
       cookies {
        forward = var.ordered_cache_behavior_forwarded_values_cookies_forward
       }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restrictions_type
      locations        = var.restrictions_locations
    }
  }
}