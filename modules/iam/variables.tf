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
