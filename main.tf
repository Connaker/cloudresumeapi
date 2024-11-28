#
#                                           DO NOT MODIFY
#


#
#   API CONFIGURATION
#

module "website_api" {
    source = "./modules/api"

    api_name                                                    = local.api_name
    api_path_part                                               = local.api_path_part
    http_method                                                 = local.http_method
    authorization                                               = local.authorization
    integration_http_method                                     = local.integration_http_method
    api_integration_type                                        = local.api_integration_type
    api_integration_uri                                         = module.website_lambda.lambda_invoke_arn
}

#
#   CDN CONFIGURATION
#

module "website_cloudfront" {
    source = "./modules/cdn"

    enable_cdn                                                  = local.enable_cdn
    cdn_default_root_object                                     = local.cdn_default_root_object
    cdn_s3_domain_name                                          = module.website_bucket.bucket_regional_domain_name
    cdn_s3_origin_id                                            = local.bucket
    cdn_api_domain_name                                         = "${module.website_api.api_id}.execute-api..amazonaws.com"
    cdn_api_origin_id                                           = local.cdn_api_origin_id
    cdn_api_origin_path                                         = local.cdn_api_origin_path
    cloudfront_default_certificate                              = local.cloudfront_default_certificate

    default_cache_behavior_viewer_protocl_policy                = local.default_cache_behavior_viewer_protocl_policy
    default_cache_behavior_target_origin_id                     = local.bucket
    default_cache_behavior_forwarded_values_query_string        = local.default_cache_behavior_forwarded_values_query_string
    default_cache_behavior_forrwarded_values_cookies_forward    = local.default_cache_behavior_forrwarded_values_cookies_forward
    
    ordered_cache_behavior_path_pattern                         = local.ordered_cache_behavior_path_pattern
    ordered_cache_behavior_target_origin_id                     = local.ordered_cache_behavior_target_origin_id
    ordered_cache_behavior_viewer_portocol_policy               = local.ordered_cache_behavior_viewer_portocol_policy
    ordered_cache_behavior_forwarded_values_query_string        = local.ordered_cache_behavior_forwarded_values_query_string
    ordered_cache_behavior_forwarded_values_cookies_forward     = local.ordered_cache_behavior_forwarded_values_cookies_forward
    restrictions_type                                           = local.restrictions_type
    restrictions_locations                                      = local.restrictions_locations
}

#
# IAM CONFIGURATION
#

module "website_lambda_iam" {
    source = "./modules/iam"

    iam_role_name                                               = local.iam_role_name
    assume_role_policy                                          = local.assume_role_policy
    iam_role_policy_policy                                      = local.iam_role_policy_policy
}

#
# LAMBDA CONFIGURATION
#

module "website_lambda" {
    source = "./modules/lambda"

    lambda_function_name                                        = local.lambda_function_name
    lambda_description                                          = local.lambda_description
    lambda_handler                                              = local.lambda_handler
    lambda_runtime                                              = local.lambda_runtime
    lambda_role                                                 = module.website_lambda_iam.iam_role_arn
    lambda_filename                                             = local.lambda_filename
    lambda_source_code_hash                                     = data.archive_file.zip.output_base64sha256
}

#
#   S3 BUCKET CONFIGURATION
#

module "website_bucket" {
    source = "./modules/bucket"

    bucket                  = local.bucket
    object_ownership        = local.object_ownership
    block_public_acls       = local.block_public_acls
    block_public_policy     = local.block_public_acls
    ignore_public_acls      = local.ignore_public_acls
    restrict_public_buckets = local.restrict_public_buckets
    public_acl              = local.public_acl
    private_acl             = local.private_acl
    suffix                  = local.suffix
    s3_error_key            = local.s3_error_key
    key_prefix_equals       = local.key_prefix_equals
    replace_key_prefix_with = local.replace_key_prefix_with
    s3_bucket_policy        = local.s3_bucket_policy

}