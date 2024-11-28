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
