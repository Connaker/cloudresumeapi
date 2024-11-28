terraform {
  #backend "local" {}
  backend "s3" {
    bucket = "connaker-terraform-statefiles"
    key    = "websitebackend/website.tfstate"
    region = "us-east-1"
  }
}