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

