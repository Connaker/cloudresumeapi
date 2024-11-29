locals {

#
#   API CONFIGURATION
#

    api_name                                                    = "website-counter-api"
    api_path_part                                               = "lambdaresource"
    http_method                                                 = "GET"
    authorization                                               = "NONE"
    integration_http_method                                     = "POST"
    api_integration_type                                        = "AWS_PROXY"

#
#   CDN CONFIGURATION
#

    enable_cdn = true

    cdn_default_root_object                                     = "/index.html"
    cdn_http_port                                               = 80
    cdn_https_port                                              = 443
    cdn_origin_keepalive_timeout                                = 5
    cdn_origin_protocol_policy                                  = "http-only"
    cdn_origin_read_timeout                                     = 30
    
    
    
    cdn_api_origin_id                                           = "API-Gateway"
    cdn_api_origin_path                                         = "/prod"
    cloudfront_default_certificate = true

    default_cache_behavior_target_origin_id                     = "s3-static-site"
    default_cache_behavior_viewer_protocl_policy                = "redirect-to-https"
    default_cache_behavior_forwarded_values_query_string        = false
    default_cache_behavior_forrwarded_values_cookies_forward    = "none"

    ordered_cache_behavior_path_pattern                         = "/api/*"
    ordered_cache_behavior_target_origin_id                     = "API-Gateway"
    ordered_cache_behavior_viewer_portocol_policy               = "redirect-to-https"

    ordered_cache_behavior_forwarded_values_query_string        = true
    ordered_cache_behavior_forwarded_values_cookies_forward     = "none"

    restrictions_type                                           = "none"

    restrictions_locations                                      = []

#
#   IAM CONFIGURATION
#
    iam_role_name                                               = "lambda-exec-role"

    assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Action    = "sts:AssumeRole",
            Effect    = "Allow",
            Principal = {
            Service = "lambda.amazonaws.com"
            }
        }
        ]
    })
    
    iam_role_policy_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })

#
# LAMBDA CONFIGURATION
#
    lambda_function_name                                        = "visit_counter"
    lambda_description                                          = "Website Visitor Counter"
    lambda_handler                                              = "main.lambda_handler"
    lambda_runtime                                              = "python3.11"
    lambda_filename                                             = "./main.zip"

#
#   S3 CONFIGURATION
#

    bucket                                                      = "connakerresumebucket"
    object_ownership                                            = "BucketOwnerPreferred"

    s3_origin_id                                                = "connakerresumebucket"

    block_public_acls                                           = false
    block_public_policy                                         = false
    ignore_public_acls                                          = false
    restrict_public_buckets                                     = false
    public_acl                                                  = "public-read"
    private_acl                                                 = "private"

    suffix                                                      = "index.html"
    s3_error_key                                                = "error.html"
    key_prefix_equals                                           = "docs/"
    replace_key_prefix_with                                     = "documents/"

    s3_bucket_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${module.website_bucket.bucket_arn}/*"
      }
    ]
  })
}