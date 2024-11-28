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

variable "api_integration_uri" {
    type = string
    default = ""
}