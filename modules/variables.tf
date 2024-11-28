#
## API GATEWAY VARIABLES ##
#

variable "api_name" {
    type = string
    default = "My-Api"
}

variable "api_path_part" {
    type = string
    default = ""
}

variable "http_method" {
    type = string
    default = ""
}

variable "authorization" {
    type = string
    default = ""
}

variable "integration_http_method" {
    type = string
    default = ""
}

variable "api_integration_type" {
    type = string
    default = ""
}

#
## CLOUDFRONT VARIABLES ##
#

variable "enable_cdn" {
    type = bool 
    default = true 

}
variable "cdn_default_root_object" {
    type = string
    default = ""
}

variable "cdn_s3_domain_name" {
    type = string
    default = ""
}
variable "cdn_s3_origin_id" {
    type = string
    default = ""
}

variable "cdn_api_domain_name"{
    type = string
    default = ""
}

variable "cdn_api_origin_id" {
    type = string
    default = ""
}

variable "cdn_api_origin_path" {
    type = string
    default = ""
}

variable "cloudfront_default_certificate" {
    type = bool
    default = true
}

variable "default_cache_behavior_allowed_methods" {
    type = list
    default = [] 
}

variable "default_cache_behavior_cached_methods" {
    type = list
    default = []
}

variable "default_cache_behavior_viewer_protocl_policy" {
    type = string 
    default = ""
}

variable "default_cache_behavior_target_origin_id" {
    type = string
    default = ""
}

variable "default_cache_behavior_forwarded_values_query_string" {
    type = bool
    default = true 
}

variable "default_cache_behavior_forrwarded_values_cookies_forward" {
    type = string
    default = ""
}

variable "ordered_cache_behavior_path_pattern" {
    type = string
    default = ""
}

variable "ordered_cache_behavior_target_origin_id" {
    type = string
    default = ""
}

variable "ordered_cache_behavior_viewer_portocol_policy" {
    type = string
    default = ""
}

variable "ordered_cache_behavior_allowed_methods" {
    type = list
    default = []
}

variable "ordered_cache_behavior_cached_methods" {
    type = list
    default = []
}

variable "ordered_cache_behavior_forwarded_values_query_string" {
    type = bool
    default = true 
}
variable "ordered_cache_behavior_forwarded_values_cookies_forward" {
    type = string
    default = ""
}

variable "restrictions_type" {
    type = string
    default = ""
}

variable "restrictions_locations" {
    type = list 
    default = []
}

#
## IAM VARIABLES ##
#
variable "iam_role_name" {
    type = string
    default = ""
}
variable "assume_role_policy" {
    default = ""

}

variable "iam_role_policy_policy"{
    default = ""
}

#
## LAMBDA VARIABLES
#
variable    "lambda_function_name" {
    default = ""

}
variable    "lambda_description" {
    default = ""

}
variable    "lambda_handler" {
    default = ""

}
variable    "lambda_runtime" {
    default = ""

}
variable    "lambda_role" {
    default = ""

}
variable    "lambda_filename" {
    default = ""

}
variable    "lambda_source_code_hash" {
    default = ""

}


#
## S3 BUCKET VARIABLES ##
#
variable "bucket" {
    type = string
    default = "my_bucket"
}

variable "object_ownership" {
    type = string
    default = "BucketOwnerPreferred"
}

variable "block_public_acls" {
    type = bool
    default = false
}

variable "block_public_policy" {
    type = bool
    default = false
}

variable "ignore_public_acls" {
    type = bool
    default = false
}

variable "restrict_public_buckets"{
    type = bool
    default = false
}

variable "public_acl" {
    type = string
    default = "public-read"
}

variable "private_acl" {
    type = string
    default = "public-read"
}

variable "suffix"{
    type = string
    default = "index.html"
}

variable "s3_error_key"{
    type = string
    default = "error.html"
}

variable "key_prefix_equals"{
    type = string
    default = "docs/"
}

variable "replace_key_prefix_with"{
    type = string
    default = "documents/"
}

variable "s3_bucket_policy" {
    type = string
    default = ""

}

